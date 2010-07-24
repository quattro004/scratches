class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string  :title, :limit => 75
      t.string  :author, :limit => 50
      t.integer :picture_id, :limit => 8
      t.text    :comment, :limit => 260
      t.text    :variations, :limit => 260
      t.integer :category_id, :limit => 8
      t.text    :ingredients
      t.text    :instructions
      t.string  :keywords, :limit => 260
      t.integer :prep_time_in_minutes, :limit => 8
      t.integer :cook_time_in_minutes, :limit => 8
      t.boolean :is_public
      t.boolean :is_secret

      t.timestamps
    end
    # Change the primary key to a bigint
    change_column :recipes, :id, :integer, :limit => 8
  end

  def self.down
    drop_table :recipes
  end
end
