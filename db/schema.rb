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

ActiveRecord::Schema.define(version: 20130919133842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "corpses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "closed"
  end

  create_table "friends_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "corpse_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.text     "message"
    t.boolean  "read",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "about"
  end

  create_table "snippets", force: true do |t|
    t.text     "body"
    t.integer  "author_id"
    t.integer  "corpse_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "name"
    t.boolean  "admin"
  end

end
