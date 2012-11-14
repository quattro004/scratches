require 'migration_helpers'

class CreateAlbumTypes < ActiveRecord::Migration
  extend MigrationHelpers

  def self.up
    create_table :album_types do |t|
      t.string :name

      t.timestamps
    end

    add_foreign_key :albums, :album_type_id, :album_types, :id, 'RESTRICT', 'RESTRICT'
  end

  def self.down
    drop_foreign_key :albums, :album_types
    drop_table :album_types
  end
end
