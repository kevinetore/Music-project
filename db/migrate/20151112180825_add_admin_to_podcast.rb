class AddAdminToPodcast < ActiveRecord::Migration
  def change
    add_column :podcasts, :admin, :string
  end
end
