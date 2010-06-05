class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string :title, :limit => 75
      t.string :author, :limit => 50
      t.integer :picture_id
      t.text :comment, :limit => 260
      t.text :alterations, :limit => 260
      t.integer :category_id
      t.text :ingredients
      t.text :instructions
      t.string :keywords, :limit => 260

      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
