require 'migration_helpers'

class AddCategoryForeignKeyToRecipe < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    add_foreign_key :recipes, :category_id, :categories, :id, 'RESTRICT', 'RESTRICT'
  end

  def self.down
    drop_foreign_key :recipes, :categories
  end
end
