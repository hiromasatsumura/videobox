class UsersController < ApplicationController
  
  def show
    @user = current_user
    @videos = Video.where(user_id: current_user.id).order("created_at DESC")
    @yt_video_ids_j = @videos.map {|video| video.yt_video_id}.to_json.html_safe
  end

end
