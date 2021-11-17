# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_17_172602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grannies", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_birth"
    t.string "gender"
    t.string "granny_mobility"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_grannies_on_user_id"
  end

  create_table "travels", force: :cascade do |t|
    t.integer "number_passenger"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "arrival_location"
    t.string "departure_location"
    t.float "latitude"
    t.float "longitude"
    t.float "arrival_latitude"
    t.float "arrival_longitude"
    t.datetime "departure_date"
    t.datetime "arrival_date"
    t.index ["user_id"], name: "index_travels_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password"
    t.string "phone_number"
    t.string "gender"
    t.string "address"
    t.boolean "driver"
    t.string "driver_licence"
    t.string "type_of_car"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "grannies", "users"
  add_foreign_key "travels", "users"
end
