class Episode < ActiveRecord::Base
  belongs_to :podcast

  has_attached_file :episode_thumbnail, styles: { large: "1000x1000#", medium: "550x550#" }
  validates_attachment_content_type :episode_thumbnail, content_type: /\Aimage\/.*\Z/

  has_attached_file :mp3
  validates_attachment :mp3, content_type: { content_type: ["audio/mpeg", "audio/mp3"] }

  def write_attribute(attr_name, value)
    check_for_youtube_proccessing(read_attribute(attr_name), value) if attr_name.intern == :youtube_url
    super
  end

  protected

  def check_for_youtube_proccessing(old_value, new_value)
    DownloadVideoJob.perform_later(self.id, new_value) unless old_value == new_value
  end
end
