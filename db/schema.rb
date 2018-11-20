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

ActiveRecord::Schema.define(version: 2018_11_20_124527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.bigint "instructor_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_availabilities_on_instructor_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "instructor_id"
    t.bigint "student_id"
    t.bigint "pick_up_point_id"
    t.bigint "drop_off_point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "time_schedule_id"
    t.index ["drop_off_point_id"], name: "index_bookings_on_drop_off_point_id"
    t.index ["instructor_id"], name: "index_bookings_on_instructor_id"
    t.index ["pick_up_point_id"], name: "index_bookings_on_pick_up_point_id"
    t.index ["student_id"], name: "index_bookings_on_student_id"
    t.index ["time_schedule_id"], name: "index_bookings_on_time_schedule_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "photo"
    t.bigint "user_id"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_instructors_on_school_id"
    t.index ["user_id"], name: "index_instructors_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "phone_number"
    t.string "email"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["location_id"], name: "index_schools_on_location_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "instructor_id"
    t.index ["instructor_id"], name: "index_students_on_instructor_id"
    t.index ["school_id"], name: "index_students_on_school_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "time_schedules", force: :cascade do |t|
    t.bigint "instructor_id"
    t.bigint "school_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_time_schedules_on_instructor_id"
    t.index ["school_id"], name: "index_time_schedules_on_school_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "address"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "availabilities", "instructors"
  add_foreign_key "bookings", "instructors"
  add_foreign_key "bookings", "students"
  add_foreign_key "bookings", "time_schedules"
  add_foreign_key "instructors", "schools"
  add_foreign_key "instructors", "users"
  add_foreign_key "schools", "locations"
  add_foreign_key "students", "instructors"
  add_foreign_key "students", "schools"
  add_foreign_key "students", "users"
  add_foreign_key "time_schedules", "instructors"
  add_foreign_key "time_schedules", "schools"
end
