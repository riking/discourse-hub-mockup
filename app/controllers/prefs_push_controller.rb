class PrefsPushController < ApplicationController
  layout 'iframe'

  def upload
    # nothing needed
  end

  def confirm
    user = get_signed_in_user
    if user.nil?
      redirect_to action: 'log_in', status: 303
    end

    unless params[:email] == user.email
      # redirect_to action: 'log_in', status: 303
    end

    if !params[:custom_avatar].nil? && to_bool(params[:custom_avatar])
      params[:custom_avatar_url] = nil
    end

    @user = user
  end

  def perform
    user = get_signed_in_user

    User.pushable_fields.each do |sym|
      new = params[:sym]
      next if new.nil?
      next if new == '_UNCHANGED'

    end
  end

  private

  def get_signed_in_user
    # mock
    User.new(email: 'radq@meta.discourse.org.example.com',
             full_name: "Vikhyat Korrapati",
             profile_background_url: "https://meta.discourse.org/uploads/default/3898/8c38a4236cad9fcc.jpg",
             bio: "[Website](http://vikhyat.net/) | [Github](https://github.com/vikhyat/) | [Twitter](https://twitter.com/vikhyatk/)",
             website: "http://vikhyat.net/",
             email_mailing_list: false,
             email_quotes_replies_mentions: true,
             new_topic_duration_minutes: 120)
  end
end
