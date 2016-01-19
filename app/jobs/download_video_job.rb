class DownloadVideoJob < ActiveJob::Base
  queue_as :default

  def perform(episode_id, video_url)
    video = YoutubeDL.download(video_url, options)
    puts video.filename

    # Using Paperclip::FileAdapter
    #episode = Episode.find(episode_id)
    #episode.mp3 = File.new(video.filename)
    #episode.save

  end

  def options
    {
      output: "~/Desktop/%(title)s.mp4",
      extract_audio: true,
      audio_format: 'mp3',
      write_thumbnail: true
    }
  end

end

