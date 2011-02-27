class Recipe < ActiveRecord::Base
  has_many  :picture, :dependent => :destroy
  has_many  :ingredient, :dependent => :destroy
  has_one   :category
  belongs_to :user
  attr_accessible :title, :instructions, :prep_time_in_minutes, :cook_time_in_minutes, :comment, :keywords, :is_public, 
    :is_secret, :yield, :original_source, :ingredient_attributes, :picture_attributes, :category_id

  accepts_nested_attributes_for :ingredient, :picture, :allow_destroy => true #, :reject_if => lambda { |a| a[:name].blank? || a[:amount].blank? }

  validates_presence_of :title
  validates_presence_of :instructions
  validates_numericality_of :cook_time_in_minutes, :greater_than_or_equal_to => 1
  validate :number_of_pictures?

  scope :public, where('is_public = ?', true)
  scope :mine, lambda { |user| where('user_id = ?', user.id) }

  private

    def number_of_pictures?
        errors.add :recipe, 'can only have a maximum of 4 pictures' unless picture.size < 4
    end
end