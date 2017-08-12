# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170812164632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "supervisor"
    t.string "location"
    t.string "sup_email"
    t.string "description"
    t.decimal "hours"
    t.string "title"
    t.datetime "date"
  end

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "students_id"
    t.index ["students_id"], name: "index_admins_on_students_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "activities_id"
    t.decimal "total_hours"
    t.index ["activities_id"], name: "index_students_on_activities_id"
  end

end
