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

ActiveRecord::Schema.define(version: 20151112100300) do

  create_table "interest_categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_interests_count", default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.date     "significant_date"
    t.text     "significant_names"
    t.integer  "interest_catogory_id"
  end

  add_index "interests", ["interest_catogory_id"], name: "index_interests_on_interest_catogory_id"

  create_table "social_providers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "provider"
    t.string   "token"
    t.string   "refresh_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "uuid"
    t.string   "profile_url"
    t.string   "profile_picture"
    t.string   "profile_email"
  end

  add_index "social_providers", ["user_id"], name: "index_social_providers_on_user_id"

  create_table "user_interests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "interest_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_interests", ["interest_id"], name: "index_user_interests_on_interest_id"
  add_index "user_interests", ["user_id"], name: "index_user_interests_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "status",          default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "formatted_name"
  end

end
