class Video < ActiveRecord::Base
  include ApplicationHelper

  belongs_to :imageable, :polymorphic => true

  attr_accessible :content_type, :data, :description, :name, :size, :uploaded_video, :imageable_id, :imageable_type, :album_id, :date_taken

  validate :video_contains_data

  validates_format_of :content_type,
                      :with => /^video/,
                      :message => '-- you can only upload videos'

  validates_size_of   :data, :maximum => 1.gigabyte, :message => 'cannot be greater than 1gb'

  validate :video_doesnt_exist

  def uploaded_video=(video_field)
    populate_album_item(self, video_field)
  end

private

  def video_contains_data
    errors.add('Video data', 'must not be blank') unless !self.data.blank?
  end

  def video_doesnt_exist
    if (self.new_record? && Video.find_by_name(self.name))
      errors.add('A video with this filename', 'already exists')
    end
  end

end
