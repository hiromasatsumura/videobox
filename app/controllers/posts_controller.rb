class PostsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @videos = Video.includes(:user).order("created_at DESC")
    @video_ids_j = @videos.map {|video| video.video_id}.to_json.html_safe
  end

  def create
    video_id = post_params[:url].gsub(/https:\/\/www.youtube.com\/watch\?v=(\w+)/){$1}.slice(0..10)
    Video.create(url: post_params[:url], text: post_params[:text], video_id: video_id, user_id: current_user.id)
    redirect_to action: :index
  end

  def destroy
    video = Video.find(params[:id])
    video.destroy if video.user_id == current_user.id
    redirect_to action: :index
  end

  def edit
    video = Video.find(params[:id])
    # コメントのみをindex画面で表示できるようにする。
    redirect_to action: :index
  end

  private
  def post_params
    params.permit(:url, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
