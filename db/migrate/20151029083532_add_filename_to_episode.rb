class AddFilenameToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :filename, :string
  end
end
