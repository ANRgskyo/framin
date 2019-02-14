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

ActiveRecord::Schema.define(version: 2019_02_05_114236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "bank_name", null: false
    t.integer "branch_number", null: false
    t.integer "account_number", null: false
    t.string "surname", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_works", force: :cascade do |t|
    t.integer "work_id", null: false
    t.integer "shopping_cart_id", null: false
    t.integer "price"
    t.integer "quantity", default: 1, null: false
    t.integer "size_id", null: false
    t.integer "sale_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.string "card_number", null: false
    t.integer "month", null: false
    t.integer "year", null: false
    t.string "cvc", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer "followed_id", null: false
    t.integer "follower_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "work_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "shopping_cart_id", null: false
    t.integer "credit_card_id", null: false
    t.integer "status", null: false
    t.string "postal_code", null: false
    t.text "address", null: false
    t.date "date", null: false
    t.integer "time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "buy_user_id", null: false
    t.integer "status", null: false
    t.integer "work_id", null: false
    t.integer "size_id", null: false
    t.integer "price", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.string "size", null: false
    t.integer "price", null: false
    t.integer "quantity", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name", null: false
    t.string "name_kana", null: false
    t.text "introduction"
    t.string "postal_code", null: false
    t.text "address", null: false
    t.string "phone_number", null: false
    t.integer "gender"
    t.string "image_id"
    t.boolean "is_active", default: true, null: false
    t.boolean "admin", default: false, null: false
    t.datetime "deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "work_name", null: false
    t.string "image_id", null: false
    t.integer "price", default: 0, null: false
    t.text "background"
    t.string "category_id", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
