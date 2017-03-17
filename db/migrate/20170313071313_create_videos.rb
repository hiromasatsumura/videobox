class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text             :url
      t.text             :text
      t.string           :video_id
      t.integer          :user_id
      t.integer          :number_of_plays
      t.timestamps
    end
  end
end
