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

ActiveRecord::Schema.define(:version => 20120329074927) do

  create_table "business_categories", :force => true do |t|
    t.integer  "category_id"
    t.integer  "business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "business_categories", ["business_id"], :name => "index_business_categories_on_business_id"
  add_index "business_categories", ["category_id"], :name => "index_business_categories_on_category_id"

  create_table "businesses", :force => true do |t|
    t.string   "name",                                           :null => false
    t.string   "trade_name"
    t.string   "email"
    t.string   "website"
    t.string   "description"
    t.string   "logo"
    t.string   "tagline"
    t.string   "showcase_url"
    t.string   "hotline_number"
    t.string   "status",                                         :null => false
    t.decimal  "longitude",       :precision => 10, :scale => 0
    t.decimal  "latitude",        :precision => 10, :scale => 0
    t.datetime "activation_date"
    t.string   "unit_no"
    t.string   "building_name"
    t.string   "street_name"
    t.string   "village"
    t.integer  "encoder_id",                                     :null => false
    t.integer  "location_id",                                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "businesses", ["location_id"], :name => "index_businesses_on_location_id"
  add_index "businesses", ["slug"], :name => "index_businesses_on_slug", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "location_type"
    t.integer  "zip_code"
    t.integer  "parent_id"
    t.string   "permalink"
    t.string   "display_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["project_id"], :name => "index_tasks_on_project_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "sex"
    t.date     "birth_date"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "username"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["location_id"], :name => "index_users_on_location_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
