require 'migration_helpers'

class CreateVideos < ActiveRecord::Migration
  extend MigrationHelpers

  def self.up
    create_table :videos do |t|
      t.string  :name
      t.string  :content_type
      t.integer :size
      t.binary  :data, :limit => 1.gigabyte
      t.string  :description
      t.integer :user_id
      t.date    :date_taken
      t.integer :album_id
      t.integer :imageable_id
      t.string  :imageable_type

      t.timestamps
    end

    add_foreign_key :videos, :user_id, :users, :id, 'RESTRICT', 'RESTRICT'
    add_foreign_key :videos, :album_id, :albums, :id
    add_index :videos, :user_id
    add_index :videos, :album_id
  end

  def self.down
    drop_foreign_key :videos, :users
    drop_foreign_key :videos, :albums
    drop_table :videos
  end
end
