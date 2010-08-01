class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  validates_presence_of :amount
  validates_presence_of :name
end
