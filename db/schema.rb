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

ActiveRecord::Schema.define(version: 20130528074706) do

  create_table "match_rounds", force: true do |t|
    t.string   "name"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "match_sets", force: true do |t|
    t.integer  "match_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.integer  "match_number"
    t.integer  "match_round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "type_account"
    t.string   "user_account"
    t.string   "email"
    t.string   "picture_url",  default: "no picture"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: true do |t|
    t.integer  "round"
    t.integer  "round_position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.integer  "total"
    t.integer  "match_set_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_matches", force: true do |t|
    t.integer  "team_id"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "picture",    default: "no picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
