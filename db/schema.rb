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

ActiveRecord::Schema[7.0].define(version: 2024_06_19_212650) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champions", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "curated_composition_id"
    t.index ["curated_composition_id"], name: "index_champions_on_curated_composition_id"
  end

  create_table "champions_curated_compositions", id: false, force: :cascade do |t|
    t.bigint "curated_composition_id"
    t.bigint "champion_id"
    t.index ["champion_id"], name: "index_champions_curated_compositions_on_champion_id"
    t.index ["curated_composition_id"], name: "index_champions_curated_compositions_on_curated_composition_id"
  end

  create_table "compositions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "champion"
    t.string "items", default: [], array: true
    t.index ["user_id"], name: "index_compositions_on_user_id"
  end

  create_table "curated_compositions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "curated_compositions_items", id: false, force: :cascade do |t|
    t.bigint "curated_composition_id"
    t.bigint "item_id"
    t.index ["curated_composition_id"], name: "index_curated_compositions_items_on_curated_composition_id"
    t.index ["item_id"], name: "index_curated_compositions_items_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "curated_composition_id"
    t.index ["curated_composition_id"], name: "index_items_on_curated_composition_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "champions", "curated_compositions"
  add_foreign_key "compositions", "users"
  add_foreign_key "items", "curated_compositions"
end
