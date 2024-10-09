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

ActiveRecord::Schema[7.2].define(version: 2024_10_09_133213) do
  create_table "items", force: :cascade do |t|
    t.string "f1"
    t.integer "f2"
    t.date "f3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items_hists", force: :cascade do |t|
    t.integer "items_id"
    t.string "f1"
    t.integer "f2"
    t.date "f3"
    t.datetime "items_created_at"
    t.datetime "items_updated_at"
    t.string "op_hist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "engine"
    t.integer "items_hist_id"
    t.index ["items_hist_id"], name: "index_items_hists_on_items_hist_id"
  end

  add_foreign_key "items_hists", "items_hists"
end
