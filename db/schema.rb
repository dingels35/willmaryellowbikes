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

ActiveRecord::Schema.define(version: 20150919224248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bike_racks", force: :cascade do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "bike_count"
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bikes", force: :cascade do |t|
    t.string   "identifier"
    t.string   "description"
    t.integer  "bike_rack_id"
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "type",                 null: false
    t.integer  "bike_id"
    t.integer  "bike_rack_id"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "location_description"
    t.text     "broken_description"
    t.boolean  "resolved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
