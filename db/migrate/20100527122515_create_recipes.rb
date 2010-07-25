class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string  :title, :limit => 75
      t.string  :author, :limit => 50
      t.text    :comment, :limit => 260
      t.text    :variations, :limit => 260
      t.integer :category_id
      t.text    :instructions
      t.string  :keywords, :limit => 260
      t.integer :prep_time_in_minutes
      t.integer :cook_time_in_minutes
      t.boolean :is_public
      t.boolean :is_secret

      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end