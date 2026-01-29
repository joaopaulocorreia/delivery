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

ActiveRecord::Schema[8.1].define(version: 2026_01_29_225551) do
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

  add_foreign_key "app_products", "app_companies"
end
