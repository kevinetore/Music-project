class AddYoutubeUrlToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :youtube_url, :string
  end
end
