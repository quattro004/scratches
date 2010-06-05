require 'migration_helpers'

class CreatePictures < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :pictures do |t|
      t.string :name
      t.string :content_type
      t.integer :size
      t.binary :data
      t.integer :recipe_id

      t.timestamps
    end

    add_foreign_key :pictures, :recipe_id, :recipes, :id
  end

  def self.down
    drop_foreign_key :pictures, :recipes
    drop_table :pictures
  end
end
