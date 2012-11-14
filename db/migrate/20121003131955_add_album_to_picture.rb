require 'migration_helpers'

class AddAlbumToPicture < ActiveRecord::Migration
  extend MigrationHelpers

  def self.up
    add_column :pictures, :album_id, :integer
    add_index  :pictures, :album_id

    add_foreign_key :pictures, :album_id, :albums, :id
  end

   def self.down
    drop_foreign_key :pictures, :albums
    remove_column :pictures, :album_id
   end
end
