class Picture < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  belongs_to :album
  attr_accessible :name, :content_type, :data, :size, :uploaded_picture, :description, :user_id, :album_id, :date_taken

  validate :picture_contains_data

  validates_format_of :content_type,
                      :with => /^image/,
                      :message => '--- you can only upload pictures'

  validates_size_of   :data, :maximum => 3.megabyte, :message => 'cannot be greater than 3mb'

  def uploaded_picture=(picture_field)
    self.name         = base_part_of(picture_field.original_filename)
    self.content_type = picture_field.content_type.chomp
    self.data         = picture_field.read
    self.size         = picture_field.size
  end

private

  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '' )
  end

  def picture_contains_data
    errors.add('Picture data', 'must not be blank') unless !self.data.blank?
  end
end
