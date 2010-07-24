require 'migration_helpers'

class CreateCategories < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :categories do |t|
      t.string  :name
      t.string  :description

      t.timestamps
    end
    # Change the primary key to a bigint
    change_column :categories, :id, :integer, :limit => 8

    add_foreign_key :recipes, :category_id, :categories, :id, 'RESTRICT', 'RESTRICT'
  end

  def self.down
    drop_foreign_key :recipes, :categories
    drop_table :categories
  end
end