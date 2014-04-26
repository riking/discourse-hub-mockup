# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140425201034) do

  create_table "users", force: true do |t|
    t.string   "email",                         null: false
    t.string   "full_name",                     null: false
    t.text     "bio"
    t.string   "website"
    t.integer  "email_digest_days"
    t.boolean  "email_private_messages"
    t.boolean  "email_quotes_replies_mentions"
    t.boolean  "email_mailing_list"
    t.boolean  "email_always"
    t.integer  "auto_track_delay_ms"
    t.integer  "new_topic_duration_minutes"
    t.boolean  "external_links_in_new_tab"
    t.boolean  "enable_quoting"
    t.boolean  "dynamic_favicon"
    t.boolean  "use_custom_avatar"
    t.string   "custom_avatar_url"
    t.string   "profile_background_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
