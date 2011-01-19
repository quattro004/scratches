class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :name, :amount, :secret, :prep

  validates_presence_of :amount
  validates_presence_of :name
end
