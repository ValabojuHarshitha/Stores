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

ActiveRecord::Schema.define(:version => 20130304125611) do

  create_table "categories", :force => true do |t|
    t.string   "category_type_id"
    t.string   "category_name"
    t.integer  "parent_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "category_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cities", :primary_key => "city_id", :force => true do |t|
    t.integer "state_id"
    t.string  "city_name", :limit => 100
  end

  add_index "cities", ["state_id"], :name => "FK_cities_states"

  create_table "countries", :primary_key => "country_id", :force => true do |t|
    t.string  "country_code",      :limit => 2
    t.string  "country_name",      :limit => 100
    t.integer "country_call_code"
  end

  create_table "customer_items", :force => true do |t|
    t.integer  "customer_list_id"
    t.integer  "item_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "customer_lists", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "customer_store_id"
    t.string   "list_name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "customer_orders", :force => true do |t|
    t.string   "order_number"
    t.integer  "total_price"
    t.boolean  "payment_completed"
    t.string   "payment_type"
    t.boolean  "payment_approved"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "customer_stores", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "store_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "location_id"
    t.integer  "city_id"
    t.string   "address"
    t.string   "email"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "userid"
  end

  create_table "items", :force => true do |t|
    t.string   "item_name"
    t.string   "item_description"
    t.decimal  "price",             :precision => 10, :scale => 0
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.integer  "vendor_id"
    t.integer  "store_category_id"
    t.integer  "quantity"
  end

  create_table "locationdistances", :force => true do |t|
    t.integer  "location_id"
    t.integer  "destination_id"
    t.float    "radius"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "locations", :force => true do |t|
    t.integer  "city_id"
    t.string   "location_name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "role_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "states", :primary_key => "state_id", :force => true do |t|
    t.integer "country_id"
    t.string  "state_name", :limit => 100
  end

  add_index "states", ["country_id"], :name => "FK_states_countries"

  create_table "store_categories", :force => true do |t|
    t.integer  "store_id"
    t.integer  "category_type_id"
    t.integer  "parent_id"
    t.string   "category_name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "location_id"
  end

  create_table "stores", :force => true do |t|
    t.string   "store_name"
    t.integer  "location_id"
    t.integer  "city_id"
    t.integer  "vendor_id"
    t.string   "store_address"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "subcategories", :force => true do |t|
    t.string   "subcategory_name"
    t.integer  "category_id"
    t.integer  "store_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "parent_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.integer  "role_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "street"
    t.text     "address"
    t.integer  "location_id"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "phone_number"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vendors", :force => true do |t|
    t.string   "vendor_name"
    t.string   "contact"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "userid"
  end

end
