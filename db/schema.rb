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

ActiveRecord::Schema.define(:version => 20110126130042) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.string   "amount"
    t.boolean  "secret"
    t.integer  "recipe_id"
    t.text     "prep"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["recipe_id"], :name => "fk_ingredients_recipes"

  create_table "pictures", :force => true do |t|
    t.string   "name"
    t.string   "content_type"
    t.integer  "size"
    t.binary   "data",         :limit => 16777215
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pictures", ["recipe_id"], :name => "fk_pictures_recipes"

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipes", ["category_id"], :name => "fk_recipes_categories"
  add_index "recipes", ["user_id"], :name => "index_recipes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
