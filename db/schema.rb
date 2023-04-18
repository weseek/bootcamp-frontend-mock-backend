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

ActiveRecord::Schema[7.0].define(version: 2023_04_18_042822) do
  create_table "sprints", force: :cascade do |t|
    t.string "name", null: false
    t.date "start_at", null: false
    t.date "end_at", null: false
    t.boolean "is_archived", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "swimlanes", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "sprint_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sprint_id"], name: "index_swimlanes_on_sprint_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name", null: false
    t.string "status", default: "new", null: false
    t.string "description"
    t.integer "swimlane_id", null: false
    t.integer "assignee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignee_id"], name: "index_tasks_on_assignee_id"
    t.index ["swimlane_id"], name: "index_tasks_on_swimlane_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "swimlanes", "sprints"
  add_foreign_key "tasks", "swimlanes"
  add_foreign_key "tasks", "users", column: "assignee_id"
end
