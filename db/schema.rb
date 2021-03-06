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

ActiveRecord::Schema.define(version: 20170305112435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string   "name"
    t.integer  "fire_station_id"
    t.string   "type"
    t.jsonb    "properties"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["fire_station_id"], name: "index_buildings_on_fire_station_id", using: :btree
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.integer  "fire_station_range_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["fire_station_range_id"], name: "index_districts_on_fire_station_range_id", using: :btree
  end

  create_table "fire_station_ranges", force: :cascade do |t|
    t.string   "name"
    t.integer  "zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zone_id"], name: "index_fire_station_ranges_on_zone_id", using: :btree
  end

  create_table "fire_stations", force: :cascade do |t|
    t.string   "name"
    t.integer  "bays"
    t.integer  "hobli_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "taluk_bit"
    t.string   "government_saction_numer"
    t.string   "address"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.bigint   "phone_number"
    t.float    "land_area"
    t.date     "date_of_establishment"
    t.decimal  "cost_of_establishment"
    t.integer  "sanctioned_strength"
    t.string   "floor_plan"
    t.integer  "status",                   default: 0
    t.index ["hobli_id"], name: "index_fire_stations_on_hobli_id", using: :btree
  end

  create_table "hoblis", force: :cascade do |t|
    t.string   "name"
    t.integer  "taluk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["taluk_id"], name: "index_hoblis_on_taluk_id", using: :btree
  end

  create_table "houses", force: :cascade do |t|
    t.integer  "house_number"
    t.integer  "number_of_bedrooms"
    t.integer  "residential_quater_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "occupant_designation"
    t.integer  "status",                default: 0
    t.index ["residential_quater_id"], name: "index_houses_on_residential_quater_id", using: :btree
  end

  create_table "taluks", force: :cascade do |t|
    t.string   "name"
    t.integer  "district_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["district_id"], name: "index_taluks_on_district_id", using: :btree
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "name"
    t.integer  "fire_station_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "registration_number"
    t.string   "make"
    t.string   "model"
    t.decimal  "cost"
    t.date     "date_of_puchase"
    t.string   "chassis_number"
    t.string   "engine_number"
    t.float    "capacity_of_fuel_tank"
    t.string   "tax_card"
    t.string   "sanction_order_number"
    t.date     "sanction_date"
    t.float    "theoretical_mileage"
    t.decimal  "kilometers_covered"
    t.index ["fire_station_id"], name: "index_vehicles_on_fire_station_id", using: :btree
  end

  create_table "zones", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "buildings", "fire_stations"
  add_foreign_key "districts", "fire_station_ranges"
  add_foreign_key "fire_station_ranges", "zones"
  add_foreign_key "fire_stations", "hoblis"
  add_foreign_key "hoblis", "taluks"
  add_foreign_key "taluks", "districts"
  add_foreign_key "vehicles", "fire_stations"
end
