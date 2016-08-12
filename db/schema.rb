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

ActiveRecord::Schema.define(version: 20160809110552) do

  create_table "flight_search_results", force: :cascade do |t|
    t.integer  "flight_search_id"
    t.string   "price"
    t.date     "out_departure_time"
    t.date     "ot_arrival_time"
    t.string   "agent"
    t.string   "airline_company"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "flight_searches", force: :cascade do |t|
    t.string   "source"
    t.date     "outdate"
    t.string   "from_location"
    t.string   "to_location"
    t.string   "result_url"
    t.string   "taken"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "skies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
