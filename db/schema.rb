# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_25_111556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "attendance", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.index ["event_id"], name: "index_attendance_on_event_id"
    t.index ["user_id"], name: "index_attendance_on_user_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.boolean "confirmation", default: false
    t.index ["event_id"], name: "index_attendances_on_event_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "date"
    t.datetime "duration"
    t.bigint "creator_id"
  end

  create_table "events_interests", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "interest_id"
    t.index ["event_id"], name: "index_events_interests_on_event_id"
    t.index ["interest_id"], name: "index_events_interests_on_interest_id"
  end

  create_table "friends", force: :cascade do |t|
    t.boolean "confirmation"
    t.bigint "user1_id"
    t.bigint "user2_id"
    t.index ["user1_id"], name: "index_friends_on_user1_id"
    t.index ["user2_id"], name: "index_friends_on_user2_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "url", null: false
    t.string "imageable_type", null: false
    t.bigint "imageable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "role"
    t.integer "carma"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_interests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "interest_id"
    t.index ["interest_id"], name: "index_users_interests_on_interest_id"
    t.index ["user_id"], name: "index_users_interests_on_user_id"
  end

  add_foreign_key "events", "users", column: "creator_id"
end
