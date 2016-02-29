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

ActiveRecord::Schema.define(version: 20160226171445) do

  create_table "follows", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "following_id", limit: 4
    t.integer  "followed_id",  limit: 4
  end

  add_index "follows", ["followed_id"], name: "fk_rails_5ef72a3867", using: :btree
  add_index "follows", ["following_id"], name: "fk_rails_9cfc70f043", using: :btree

  create_table "tweets", force: :cascade do |t|
    t.string   "text",       limit: 255
    t.integer  "twitter_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tweets", ["twitter_id"], name: "index_tweets_on_twitter_id", using: :btree

  create_table "twitters", force: :cascade do |t|
    t.string   "username",   limit: 255, null: false
    t.string   "biography",  limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "twitters", ["username"], name: "index_twitters_on_username", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255, null: false
    t.string   "password_digest", limit: 255
    t.integer  "userable_id",     limit: 4
    t.string   "userable_type",   limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["userable_type", "userable_id"], name: "index_users_on_userable_type_and_userable_id", using: :btree

  add_foreign_key "follows", "twitters", column: "followed_id"
  add_foreign_key "follows", "twitters", column: "following_id"
  add_foreign_key "tweets", "twitters"
end
