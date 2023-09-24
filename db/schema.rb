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

ActiveRecord::Schema[7.0].define(version: 2023_09_24_004603) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "room_members", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.string "name"
    t.integer "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_members_on_room_id"
  end

  create_table "room_messages", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "room_member_id", null: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sender_name"
    t.index ["room_id"], name: "index_room_messages_on_room_id"
    t.index ["room_member_id"], name: "index_room_messages_on_room_member_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_rooms_on_name", unique: true
  end

  add_foreign_key "room_members", "rooms"
  add_foreign_key "room_messages", "room_members"
  add_foreign_key "room_messages", "rooms"
end
