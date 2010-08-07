require 'migration_helpers'

class CreateIngredients < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :ingredients do |t|
      t.string  :name
      t.string  :amount
      t.boolean :secret
      t.integer :recipe_id
      t.text    :prep, :limit => 420
      
      t.timestamps
    end

    add_foreign_key :ingredients, :recipe_id, :recipes, :id
  end

  def self.down
    drop_foreign_key :ingredients, :recipes
    drop_table :ingredients
  end
end
