class Category < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :name, :description
end
