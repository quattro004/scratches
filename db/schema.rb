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

ActiveRecord::Schema.define(:version => 20140824151537) do

  create_table "album_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.integer  "album_type_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "albums", ["album_type_id"], :name => "fk_albums_album_types"
  add_index "albums", ["user_id"], :name => "index_albums_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.string   "amount"
    t.boolean  "secret"
    t.integer  "recipe_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ingredients", ["recipe_id"], :name => "fk_ingredients_recipes"

  create_table "pictures", :force => true do |t|
    t.string   "name"
    t.string   "content_type"
    t.integer  "size"
    t.binary   "data",           :limit => 16777215
    t.integer  "recipe_id"
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "album_id"
    t.date     "date_taken"
    t.integer  "imageable_id"
    t.string   "imageable_type"
  end

  add_index "pictures", ["album_id"], :name => "index_pictures_on_album_id"
  add_index "pictures", ["recipe_id"], :name => "index_pictures_on_recipe_id"
  add_index "pictures", ["user_id"], :name => "index_pictures_on_user_id"

  create_table "recipes", :force => true do |t|
    t.string   "title",                :limit => 75
    t.integer  "user_id"
    t.text     "comment"
    t.integer  "category_id"
    t.text     "instructions"
    t.string   "keywords",             :limit => 260
    t.integer  "prep_time_in_minutes"
    t.integer  "cook_time_in_minutes"
    t.boolean  "is_public",                           :default => true
    t.boolean  "is_secret"
    t.string   "yield",                :limit => 75
    t.string   "original_source",      :limit => 75
    t.text     "preparation"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "recipes", ["category_id"], :name => "fk_recipes_categories"
  add_index "recipes", ["user_id"], :name => "index_recipes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name"
    t.string   "role"
    t.boolean  "approved",               :default => false, :null => false
  end

  add_index "users", ["approved"], :name => "index_users_on_approved"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "name"
    t.string   "content_type"
    t.integer  "size"
    t.binary   "data",           :limit => 2147483647
    t.string   "description"
    t.integer  "user_id"
    t.date     "date_taken"
    t.integer  "album_id"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "videos", ["album_id"], :name => "index_videos_on_album_id"
  add_index "videos", ["user_id"], :name => "index_videos_on_user_id"

end
