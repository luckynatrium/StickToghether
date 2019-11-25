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

ActiveRecord::Schema.define(version: 2019_11_22_164419) do

  create_table "event", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "date"
    t.datetime "duration"
  end

  create_table "friends", force: :cascade do |t|
    t.integer "id_user1"
    t.integer "id_user2"
  end

  create_table "interest", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "role"
    t.integer "carma"
  end

end
