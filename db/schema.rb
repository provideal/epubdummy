# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120213142226) do

  create_table "annotations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "scenario_id"
    t.text     "data"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "annotations", ["scenario_id"], :name => "index_annotations_on_scenario_id"
  add_index "annotations", ["user_id"], :name => "index_annotations_on_user_id"

  create_table "epubs", :force => true do |t|
    t.string   "name"
    t.string   "file"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "epubs_semapps", :id => false, :force => true do |t|
    t.integer "epub_id",   :null => false
    t.integer "semapp_id", :null => false
  end

  add_index "epubs_semapps", ["epub_id"], :name => "index_epubs_semapps_on_epub_id"
  add_index "epubs_semapps", ["semapp_id"], :name => "index_epubs_semapps_on_semapp_id"

  create_table "scenarios", :force => true do |t|
    t.integer  "epub_id"
    t.integer  "semapp_id"
    t.string   "name"
    t.boolean  "active"
    t.integer  "version"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "scenarios", ["epub_id"], :name => "index_scenarios_on_epub_id"

  create_table "semapps", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "semapps", ["user_id"], :name => "index_semapps_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "password_digest"
    t.integer  "roles_mask"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
