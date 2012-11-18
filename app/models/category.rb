class Category < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :name, :description
  validates_presence_of :name
end
