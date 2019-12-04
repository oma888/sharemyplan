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

ActiveRecord::Schema.define(version: 2019_12_03_161213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cotisations", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id"
    t.bigint "subscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "state"
    t.string "checkout_session_id"
    t.index ["subscription_id"], name: "index_cotisations_on_subscription_id"
    t.index ["user_id"], name: "index_cotisations_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.boolean "unviewed", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "message"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.bigint "cotisation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cotisation_id"], name: "index_reviews_on_cotisation_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "number_of_places"
    t.float "total_price"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "available_places"
    t.string "identifiant"
    t.string "password"
    t.bigint "user_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_subscriptions_on_service_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "photo"
    t.float "cagnotte", default: 5.0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cotisations", "subscriptions"
  add_foreign_key "cotisations", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "reviews", "cotisations"
  add_foreign_key "subscriptions", "services"
  add_foreign_key "subscriptions", "users"
end
