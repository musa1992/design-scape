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

ActiveRecord::Schema.define(version: 2021_06_27_134539) do

  create_table "accounts", force: :cascade do |t|
    t.boolean "merchant_account", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "merchant_accounts", force: :cascade do |t|
    t.integer "account_id", null: false
    t.decimal "balance", precision: 11, scale: 2
    t.decimal "amount_on_hold", precision: 11, scale: 2
    t.decimal "total_sales", precision: 11, scale: 2
    t.string "account_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_merchant_accounts_on_account_id"
  end

  add_foreign_key "merchant_accounts", "accounts"
end
