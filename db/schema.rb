# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_07_02_163458) do

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "hotel_id", null: false
    t.date "check_in_date"
    t.date "check_out_date"
    t.integer "room_type_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_bookings_on_hotel_id"
    t.index ["room_type_id"], name: "index_bookings_on_room_type_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cuisines", force: :cascade do |t|
    t.string "region"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string "hotel_name"
    t.text "description"
    t.string "location"
    t.string "contact_details"
    t.text "amenities"
    t.text "photo_gallery"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.text "ingredients"
    t.text "instructions"
    t.integer "cuisine_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cuisine_id"], name: "index_recipes_on_cuisine_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "hotel_id", null: false
    t.integer "rating"
    t.text "comment"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_reviews_on_hotel_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.integer "hotel_id", null: false
    t.string "name", null: false
    t.text "description"
    t.integer "capacity"
    t.decimal "price_per_night", precision: 8, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_room_types_on_hotel_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookings", "hotels"
  add_foreign_key "bookings", "room_types"
  add_foreign_key "bookings", "users"
  add_foreign_key "reviews", "hotels"
  add_foreign_key "reviews", "users"
  add_foreign_key "room_types", "hotels"
end
