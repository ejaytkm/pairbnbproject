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

ActiveRecord::Schema.define(version: 20161129094957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: :cascade do |t|
    t.integer  "max_occupants"
    t.string   "city"
    t.string   "address"
    t.decimal  "price"
    t.boolean  "availability",        default: true
    t.text     "description"
    t.integer  "number_of_bathrooms"
    t.integer  "number_of_bedrooms"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
    t.string   "image"
    t.string   "heading"
    t.index ["user_id"], name: "index_listings_on_user_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.string  "transaction_id"
    t.integer "amount"
    t.integer "last_four_digit"
    t.string  "card_type"
  end

  create_table "profiles", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "gender"
    t.string  "language"
    t.string  "currency"
    t.string  "description"
    t.string  "address"
    t.integer "phone_number"
    t.integer "user_id"
    t.string  "image"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "check_in"
    t.date     "check_out"
    t.integer  "payment_id"
    t.integer  "price"
    t.index ["listing_id"], name: "index_reservations_on_listing_id", using: :btree
    t.index ["payment_id"], name: "index_reservations_on_payment_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128
    t.string   "roles",                          default: "tenant"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "listings", "users"
end
