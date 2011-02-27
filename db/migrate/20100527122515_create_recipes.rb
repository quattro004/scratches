class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string  :title, :limit => 75
      t.integer :user_id
      t.text    :comment, :limit => 260
      t.integer :category_id
      t.text    :instructions
      t.string  :keywords, :limit => 260
      t.integer :prep_time_in_minutes
      t.integer :cook_time_in_minutes
      t.boolean :is_public, :default => true
      t.boolean :is_secret
      t.string  :yield, :limit => 75
      t.string  :original_source, :limit => 75
      t.text    :preparation

      t.timestamps
    end

    add_index :recipes, :user_id
  end

  def self.down
    drop_table :recipes
  end
end