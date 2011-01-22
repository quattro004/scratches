class Picture < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :name, :content_type, :data, :size, :uploaded_picture

  validates_format_of :content_type,
                      :with => /^image/,
                      :message => '--- you can only upload pictures',
                      :if => :contains_data

  validates_size_of   :data, :maximum => 1.megabyte, :message => 'cannot be greater than 1mb',
                      :if => :contains_data

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
end