class AlbumType < ActiveRecord::Base
  belongs_to :album
  attr_accessible :name
end
