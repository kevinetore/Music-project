class DownloadVideoJob < ActiveJob::Base
  queue_as :default

  def perform(episode_id, video_url)
    video = YoutubeDL::Video.new(video_url, output: Rails.root.join('music', 'mp3', '%(title)s-%()s.%(ext)s').to_s, extract_audio: true, audio_format: 'mp3')

    video.download

    # Using Paperclip::FileAdapter
    Episode.find(episode_id).mp3 = File.new(video.filename)

    # Remove temporary file.
    FileUtils.rm(video.filename)
  end
end
