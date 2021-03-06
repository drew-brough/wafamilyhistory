# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091030023411) do

  create_table "admins", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.boolean  "super_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "instructor"
    t.time     "starttime"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "enrollments", :force => true do |t|
    t.integer  "course_id"
    t.integer  "registration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", :force => true do |t|
    t.string   "given_name"
    t.string   "surname"
    t.string   "email"
    t.string   "lunch"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "wants_syllabus"
  end

  create_table "settings", :force => true do |t|
    t.string   "hoptoad_api_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
