class User < ActiveRecord::Base

  def self.pushable_fields
    [:full_name, :bio, :website, :use_custom_avatar, :custom_avatar_url,
     :profile_background_url, :email_digest_days, :email_private_messages,
     :email_quotes_replies_mentions, :email_mailing_list, :email_always,
     :auto_track_delay_ms, :new_topic_duration_minutes,
     :external_links_in_new_tab, :enable_quoting, :dynamic_favicon,
    ]
  end
end

# == Schema Information
#
# Table name: users
#
#  id                            :integer          not null, primary key
#  email                         :string(255)      not null
#  full_name                     :string(255)      not null
#  bio                           :text
#  website                       :string(255)
#  email_digest_days             :integer
#  email_private_messages        :boolean
#  email_quotes_replies_mentions :boolean
#  email_mailing_list            :boolean
#  email_always                  :boolean
#  auto_track_delay_ms           :integer
#  new_topic_duration_minutes    :integer
#  external_links_in_new_tab     :boolean
#  enable_quoting                :boolean
#  dynamic_favicon               :boolean
#  use_custom_avatar             :boolean
#  custom_avatar_url             :string(255)
#  profile_background_url        :string(255)
#  created_at                    :datetime
#  updated_at                    :datetime
#
