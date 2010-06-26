class Recipe < ActiveRecord::Base
  has_many :picture
  has_one :category
end