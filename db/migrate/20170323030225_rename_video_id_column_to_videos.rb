class RenameVideoIdColumnToVideos < ActiveRecord::Migration
  def change
    rename_column :videos, :video_id, :yt_video_id
  end
end
