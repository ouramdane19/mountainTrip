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

ActiveRecord::Schema.define(version: 2019_02_19_142432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "itineraries", force: :cascade do |t|
    t.string "coord_x"
    t.string "coord_y"
    t.string "diffculty"
    t.integer "elevation_max"
    t.integer "height_diff_up"
    t.string "engagement_rating"
    t.string "equipment_rating"
    t.string "activities"
    t.string "orientations"
    t.integer "number_of_outings"
    t.string "title"
    t.string "picture_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "coord_long"
    t.float "coord_lat"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_messages_on_trip_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "itinerary_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["itinerary_id"], name: "index_trips_on_itinerary_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "user_trips", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_user_trips_on_trip_id"
    t.index ["user_id"], name: "index_user_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "trips"
  add_foreign_key "messages", "users"
  add_foreign_key "trips", "itineraries"
  add_foreign_key "trips", "users"
  add_foreign_key "user_trips", "trips"
  add_foreign_key "user_trips", "users"
end
