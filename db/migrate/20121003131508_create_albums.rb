require 'migration_helpers'

class CreateAlbums < ActiveRecord::Migration
  extend MigrationHelpers

  def self.up
    create_table :albums do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.integer :album_type_id

      t.timestamps
    end

    add_foreign_key :albums, :user_id, :users, :id, 'RESTRICT', 'RESTRICT'
    add_index :albums, :user_id
  end

  def self.down
    drop_foreign_key :albums, :users
    drop_table :albums
  end
end
