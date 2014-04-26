(function($, undefined) {
  "use strict";

  window.onload = function() {
    var $container = $('#container');
    var $form = $('#form');

    var $buttons = $('li .btn');
    $buttons.click(function(event) {
      var btn = event.target,
          key = btn.dataset.name,
          $li = $(btn.parentNode);

      $li.removeClass('modify add remove');
      $li.addClass('strike');

      $form.children("[name=" + key + "]").val("_UNCHANGED");

      $container.removeClass('no-reconfirm');
      $container.addClass('reconfirm');
    });
  };
})(window.jQuery);