class UsersController < ApplicationController
  
  def show
    @user = current_user
    @videos = current_user.videos.order("created_at DESC")
    @video_ids_j = @videos.map {|video| video.video_id}.to_json.html_safe
  end

end
