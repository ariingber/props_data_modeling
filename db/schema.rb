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

ActiveRecord::Schema.define(version: 20160527214453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "choice"
    t.integer  "prop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "created_by"
    t.integer  "user_id"
  end

  add_index "answers", ["prop_id"], name: "index_answers_on_prop_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "prop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["prop_id"], name: "index_comments_on_prop_id", using: :btree

  create_table "props", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "choice"
  end

  add_index "props", ["user_id"], name: "index_props_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "score",           default: 0
    t.integer  "prop_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "created_by"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["prop_id"], name: "index_users_on_prop_id", using: :btree

  create_table "wins", force: :cascade do |t|
    t.string   "correctAnswer"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "wins", ["user_id"], name: "index_wins_on_user_id", using: :btree

end
