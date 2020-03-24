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

ActiveRecord::Schema.define(version: 2020_03_24_194642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consumptions", force: :cascade do |t|
    t.text "description"
    t.integer "feeling_score"
    t.boolean "win"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
  end

  create_table "dailies", force: :cascade do |t|
    t.date "date"
    t.string "habit"
    t.boolean "done"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.date "date"
    t.text "description"
    t.integer "total_minutes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hrvs", force: :cascade do |t|
    t.date "date"
    t.integer "hrv"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sleeps", force: :cascade do |t|
    t.date "date"
    t.integer "hrs"
    t.integer "mins"
    t.float "total_hrs"
    t.float "total_mins"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weekly_data", force: :cascade do |t|
    t.date "week_of"
    t.integer "meditation_days"
    t.integer "journal_days"
    t.integer "winning_consumption_days"
    t.integer "no_alcohol_days"
    t.integer "exercise_days"
    t.float "total_sleep_hours"
    t.integer "shower_days"
    t.integer "am_brush_days"
    t.integer "pm_brush_days"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
