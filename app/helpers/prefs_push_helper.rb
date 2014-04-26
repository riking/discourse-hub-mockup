module PrefsPushHelper

  def js_file(page)
    content_for(:head, javascript_include_tag("/prefs_push/#{page}"))
  end

  def empty_form_inputs
    User.pushable_fields.reduce '' do |c, sym|
      c << tag(:input, name: sym, type: 'hidden', value: '_UNCHANGED')
    end.html_safe
  end

  def filled_form_inputs(params)
    User.pushable_fields.reduce '' do |c, sym|
      if params[sym]
        c << tag(:input, name: sym, type: 'hidden', value: params[sym])
      end
      c
    end.html_safe
  end

  def changed_list(user, params)
    content_tag :ul do
      User.pushable_fields.reduce '' do |c, sym|
        c << changed_tag(user, params, sym)
      end.html_safe
    end.to_s.html_safe
  end

  def simple_value(value, type, old = false)
    case type
      when :boolean
        value ? "<b class='true'>true</b>" : "<b class='false'>false</b>"
      else
        content_tag :b, value, class: (old ? 'old' : '')
    end
  end

  # TODO i18n
  def changed_tag(user, params, symbol)
    old = user.send(symbol)
    new = params[symbol]
    type = User.columns_hash[symbol.to_s].type

    new = nil if new == ''
    new = old if new == '_UNCHANGED'
    if type == :boolean
      new = to_bool(new)
    end

    classes = ['changed']

    str = ""
    str << (content_tag :button, '-', :'data-name' => symbol, class: 'btn in-list')

    if old.nil? && new.nil?
      str << "Keep #{h symbol} unset"
      return content_tag :li, str.html_safe, class: 'not-set not-changed'
    elsif old == new
      str << "Keep #{h symbol} unchanged"
      if type != :text
        str << " at #{simple_value old, type}"
      end
      return content_tag :li, str.html_safe, class: 'not-changed'
    end

    if old.nil?
      classes << 'add'
      str << "Set "
    elsif new.nil?
      classes << 'remove'
      str << "Clear "
    else
      classes << 'modify'
      str << "Change "
    end

    str << h(symbol) # TODO i18n


    if [:profile_background_url, :custom_avatar_url].include? symbol
      classes << 'images'
      str << content_tag(:div, class: 'image-compare') do
        str2 = ""
        unless old.nil?
          str2 << tag(:img, class: 'removed', src: old)
        end
        unless new.nil? or old.nil?
          str2 << content_tag(:span, ' → ')
        end
        unless new.nil?
          str2 << tag(:img, class: 'added', src: new)
        end
        str2.html_safe
      end
    elsif type != :text
      str << " to #{simple_value new, type}" unless new.nil?
      str << " (was #{simple_value old, type, true})" unless old.nil?
    end

    content_tag :li, str.html_safe, class: classes.join(' ')
  end
end
