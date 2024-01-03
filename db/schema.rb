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

ActiveRecord::Schema[7.1].define(version: 2024_01_03_014415) do
  create_table "comments", force: :cascade do |t|
    t.date "date"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string "reward_url1"
    t.string "reward_url2"
    t.string "reward_url3"
    t.string "reward_url4"
    t.string "reward_url5"
    t.string "reward_url6"
    t.string "reward_url7"
    t.string "reward_url8"
    t.string "reward_url9"
    t.string "reward_url10"
    t.boolean "show_uncompleted_todos"
    t.string "display_background"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.date "deadline"
    t.boolean "completed", default: false
    t.date "completion_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
