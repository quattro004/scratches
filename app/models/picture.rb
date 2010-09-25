class Picture < ActiveRecord::Base
  belongs_to :recipe

  validates_format_of :content_type,
                      :with => /^image/,
                      :message => '--- you can only upload pictures'

  def uploaded_picture=(picture_field)
    self.name         = base_part_of(picture_field.original_filename)
    self.content_type = picture_field.content_type.chomp
    self.data         = picture_field.read
    self.size         = picture_field.size
  end

  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '' )
  end
end