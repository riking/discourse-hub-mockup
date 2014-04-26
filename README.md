Functional 'mockup' of publishing preferences to the Discourse Hub.

The Discourse site will load `https://hub.discourse.org/prefs_push/upload` in an iframe and send it a Cross-Document Message.

To emulate this, go to `localhost:3000/prefs_push/upload` (you should see "Please wait...") and enter one of these in the console:

    var event = new MessageEvent('message', {"data": "{\"email\":\"rikingcoding@gmail.example.com\",\"full_name\":\"Kane York\",\"use_custom_avatar\":false,\"custom_avatar_url\":\"https://www.gravatar.com/avatar/5120fc4e345db0d1a964888272073819.png?s=80&r=pg&d=identicon\",\"profile_background_url\":\"https://meta.discourse.org/uploads/default/4279/16e6af5c9465466e.png\",\"bio\":\"I'm Riking. I'm currently a student at Cal Poly SLO.\\n\\nFrom about Nov 2012-2013, I was involved with the CraftBukkit Minecraft server mod and plugins for it. This summer, I'll be starting an internship at Discourse!\\n\\nhttps://github.com/riking\\n\",\"website\":\"http://riking.github.io\",\"email_digest_days\":7,\"email_private_messages\":true,\"email_mailing_list\":false,\"auto_track_delay_ms\":0,\"new_topic_duration_minutes\":-1,\"external_links_in_new_tab\":true,\"enable_quoting\":true,\"dynamic_favicon\":true,\"last_pushed_from\":\"Discourse Meta\",\"prefs_protocol_version\":1}"}); window.dispatchEvent(event);

.

    var event = new MessageEvent('message', {"data": "{\"full_name\":\"Vikhyat Korrapati\",\"custom_avatar_url\":\"https://www.gravatar.com/avatar/f93f4bd5744af55316b5b5b500552629.png?s=40&r=pg&d=identicon\",\"profile_background_url\":\"https://meta.discourse.org/uploads/default/3898/8c38a4236cad9fcc.jpg\",\"bio\":\"[Website](http://vikhyat.net/) | [Github](https://github.com/vikhyat/) | [Twitter](https://twitter.com/vikhyatk/)\",\"website\":\"http://vikhyat.net\",\"last_pushed_from\":\"Discourse Meta\",\"prefs_protocol_version\":1}"}); window.dispatchEvent(event);

(@radq feel free to edit your actual preferences in there. However, it serves as a fairly good test of "lots of missing parameters".)

The current `get_signed_in_user` method is designed to give a good spread of cases with the first set of sample data.


