(function($, undefined) {
  "use strict";

  var VERSION = 1;

  var allowedKeys = [
    "prefs_protocol_version", "email", "full_name",
    "use_custom_avatar", "custom_avatar_url", "profile_background_url",
    "bio", "website", "email_digest_days", "email_private_messages",
    "email_quotes_replies_mentions", "email_mailing_list",
    "email_always", "auto_track_delay_ms", "new_topic_duration_minutes",
    "external_links_in_new_tab", "enable_quoting", "dynamic_favicon",
    "last_pushed_from"
  ];

  function fillPrefsForm(prefsData) {
    var $form = $('#fillme');

    allowedKeys.forEach(function(key) {
      $form.children("[name=" + key + "]").val(prefsData[key]);
    });

    $form.submit();
  }

  var got_prefs = false;

  function recievePreferences(event) {
    if (got_prefs) {
      throw "double message";
    }
    got_prefs = true;

    var preferencesData = JSON.parse(event.data);

    var givenVersion = preferencesData.prefs_protocol_version;

    if ((givenVersion === undefined) || (typeof givenVersion !== "number")) {
      showError("Error: The preferences version was not given in the input.");
      return;
    }
    if (givenVersion !== VERSION) {
      showError("Error: The forum submitted an old format of your preferences. Please ask the forum owner to upgrade.");
      return;
    }

    var ok = Object.keys(preferencesData).every(function(key) {
      return allowedKeys.indexOf(key) !== -1;
    });

    if (!ok) {
      showError("Error: Extra data was provided. The preferences upload cannot continue.");
      return;
    }

    fillPrefsForm(preferencesData);
  }

  window.addEventListener('message', recievePreferences, false);

})(window.jQuery);