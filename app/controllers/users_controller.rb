class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @videos = Video.where(user_id: @user.id).order("created_at DESC")
    @yt_video_ids_j = @videos.map {|video| video.yt_video_id}.to_json.html_safe
  end

end