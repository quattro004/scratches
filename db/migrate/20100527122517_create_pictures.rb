require 'migration_helpers'

class CreatePictures < ActiveRecord::Migration
  extend MigrationHelpers

  def self.up
    create_table :pictures do |t|
      t.string  :name
      t.string  :content_type
      t.integer :size
      t.binary  :data, :limit => 3.megabyte
      t.integer :recipe_id
      t.integer :user_id
      t.string  :description

      t.timestamps
    end

    add_foreign_key :pictures, :recipe_id, :recipes, :id
    add_foreign_key :pictures, :user_id, :users, :id, 'RESTRICT', 'RESTRICT'
    add_index :pictures, :recipe_id
    add_index :pictures, :user_id
  end

  def self.down
    drop_foreign_key :pictures, :recipes
    drop_foreign_key :pictures, :users
    drop_table :pictures
  end
end
