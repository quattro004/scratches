class Picture < ActiveRecord::Base
  include ApplicationHelper

  belongs_to :imageable, :polymorphic => true
  attr_accessible :name, :content_type, :data, :size, :uploaded_picture, :description, :user_id, :album_id, :date_taken, :imageable_id, :imageable_type

  validate :picture_contains_data

  validates_format_of :content_type,
                      :with => /^image/,
                      :message => '-- you can only upload pictures',
                      :unless => :ends_with_image_ext # This was added because some phones send application/octet-stream instead of an image content type.

  validates_size_of   :data, :maximum => 3.megabyte, :message => 'cannot be greater than 3mb'

  validate :picture_doesnt_exist

  def uploaded_picture=(picture_field)
    populate_album_item(self, picture_field)
  end

private

  def picture_contains_data
    errors.add('Picture data', 'must not be blank') unless !self.data.blank?
  end

  def picture_doesnt_exist
    if (self.new_record? && Picture.find_by_name(self.name))
      errors.add('A picture with this filename', 'already exists')
    end
  end

  def ends_with_image_ext
    return self.name.downcase =~ /\A*(jpeg|jpg|gif|png)\Z/
  end
end
