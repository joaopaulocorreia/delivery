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

ActiveRecord::Schema[8.1].define(version: 2026_01_30_140214) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "app_companies", force: :cascade do |t|
    t.boolean "active", default: false, null: false
    t.string "company", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company"], name: "index_app_companies_on_company", unique: true
  end

  create_table "app_products", force: :cascade do |t|
    t.boolean "active", default: false, null: false
    t.bigint "app_company_id", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.decimal "price", precision: 8, scale: 2, null: false
    t.string "product", null: false
    t.datetime "updated_at", null: false
    t.index ["app_company_id"], name: "index_app_products_on_app_company_id"
    t.index ["product"], name: "index_app_products_on_product", unique: true
  end

  create_table "auth_app_accounts", force: :cascade do |t|
    t.boolean "active", default: false, null: false
    t.bigint "app_company_id"
    t.bigint "auth_user_id"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["app_company_id"], name: "index_auth_app_accounts_on_app_company_id"
    t.index ["auth_user_id", "app_company_id"], name: "index_auth_app_accounts_on_auth_user_id_and_app_company_id", unique: true
    t.index ["auth_user_id"], name: "index_auth_app_accounts_on_auth_user_id"
  end

  create_table "auth_sessions", force: :cascade do |t|
    t.bigint "app_company_id"
    t.bigint "auth_user_id"
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.index ["app_company_id"], name: "index_auth_sessions_on_app_company_id"
    t.index ["auth_user_id"], name: "index_auth_sessions_on_auth_user_id"
  end

  create_table "auth_users", force: :cascade do |t|
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_auth_users_on_email", unique: true
  end

  add_foreign_key "app_products", "app_companies"
  add_foreign_key "auth_app_accounts", "app_companies"
  add_foreign_key "auth_app_accounts", "auth_users"
  add_foreign_key "auth_sessions", "app_companies"
  add_foreign_key "auth_sessions", "auth_users"
end
