require 'migration_helpers'

class CreatePictures < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :pictures do |t|
      t.string  :name
      t.string  :content_type
      t.integer :size
      t.binary  :data
      t.integer :recipe_id, :limit => 8

      t.timestamps
    end
    # Change the primary key to a bigint
    change_column :pictures, :id, :integer, :limit => 8

    add_foreign_key :pictures, :recipe_id, :recipes, :id
  end

  def self.down
    drop_foreign_key :pictures, :recipes
    drop_table :pictures
  end
end
