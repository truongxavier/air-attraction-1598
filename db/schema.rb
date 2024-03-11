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

ActiveRecord::Schema[7.1].define(version: 2024_03_11_150940) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "park_reviews", force: :cascade do |t|
    t.bigint "rental_id", null: false
    t.text "comment"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_id"], name: "index_park_reviews_on_rental_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.text "park_description"
    t.text "chambers_description"
    t.text "restaurants_description"
    t.text "location"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parks_on_user_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "park_id", null: false
    t.date "arrival_date"
    t.date "departure_date"
    t.integer "visitors_number"
    t.boolean "validated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["park_id"], name: "index_rentals_on_park_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "park_reviews", "rentals"
  add_foreign_key "parks", "users"
  add_foreign_key "rentals", "parks"
  add_foreign_key "rentals", "users"
end
