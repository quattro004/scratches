class Picture < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  belongs_to :album
  attr_accessible :name, :content_type, :data, :size, :uploaded_picture, :description, :user_id, :album_id, :date_taken

  validates_format_of :content_type,
                      :with => /^image/,
                      :message => '--- you can only upload pictures',
                      :if => :contains_data

  validates_size_of   :data, :maximum => 3.megabyte, :message => 'cannot be greater than 3mb',
                      :if => :contains_data

  validate :date_taken_is_valid_date

  def uploaded_picture=(picture_field)
    self.name         = base_part_of(picture_field.original_filename)
    self.content_type = picture_field.content_type.chomp
    self.data         = picture_field.read
    self.size         = picture_field.size
  end

  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '' )
  end

  private

  def contains_data
    !self.data.blank?
  end

  def date_taken_is_valid_date
    errors.add(:date_taken, 'must be a valid date') unless Date.valid_date?(date_taken.year, date_taken.month, date_taken.day)
  end
end
