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

ActiveRecord::Schema.define(version: 20160420234230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diners", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "diners", ["email"], name: "index_diners_on_email", unique: true, using: :btree
  add_index "diners", ["reset_password_token"], name: "index_diners_on_reset_password_token", unique: true, using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer  "diner_id"
    t.integer  "seat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "date"
    t.integer  "head_count"
  end

  create_table "restaurant_admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "restaurant_admins", ["email"], name: "index_restaurant_admins_on_email", unique: true, using: :btree
  add_index "restaurant_admins", ["reset_password_token"], name: "index_restaurant_admins_on_reset_password_token", unique: true, using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.text     "bio"
    t.integer  "restaurant_admin_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "max_reservation_size"
  end

  create_table "seats", force: :cascade do |t|
    t.string   "status"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "date"
    t.integer  "timeslot_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.string   "time"
    t.integer  "restaurant_id"
    t.integer  "seat_count"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
