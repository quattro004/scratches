class Album < ActiveRecord::Base
  has_one :album_type
  belongs_to :user
  has_many :pictures, :as => :imageable
  has_many :videos, :as => :imageable
  attr_accessible :description, :name, :user_id, :album_type_id

  validates_presence_of :name

  scope :by_type, lambda { |album_type_id| where('album_type_id = ?', album_type_id) }
end
