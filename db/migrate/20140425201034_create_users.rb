class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :full_name, null: false
      t.text :bio
      t.string :website
      t.integer :email_digest_days
      t.boolean :email_private_messages
      t.boolean :email_quotes_replies_mentions
      t.boolean :email_mailing_list
      t.boolean :email_always
      t.integer :auto_track_delay_ms
      t.integer :new_topic_duration_minutes
      t.boolean :external_links_in_new_tab
      t.boolean :enable_quoting
      t.boolean :dynamic_favicon
      t.boolean :use_custom_avatar
      t.string :custom_avatar_url
      t.string :profile_background_url

      t.timestamps
    end
  end
end
