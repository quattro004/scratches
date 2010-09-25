class Recipe < ActiveRecord::Base
  has_many  :picture, :dependent => :destroy
  has_many  :ingredient, :dependent => :destroy
  has_one   :category

  accepts_nested_attributes_for :ingredient, :picture, :allow_destroy => true #, :reject_if => lambda { |a| a[:name].blank? || a[:amount].blank? }

  validates_presence_of :title
  validates_presence_of :instructions
  validates_numericality_of :prep_time_in_minutes, :greater_than_or_equal_to => 1
  validates_numericality_of :cook_time_in_minutes, :greater_than_or_equal_to => 1
end