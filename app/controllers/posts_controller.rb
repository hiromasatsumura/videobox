class PostsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @videos = Video.includes(:user).order("created_at DESC")
    @yt_video_ids_j = @videos.map {|video| video.yt_video_id}.to_json.html_safe
  end

  def create
    yt_video_id = post_params[:url].gsub(/https:\/\/www.youtube.com\/watch\?v=(\w+)/){$1}.slice(0..10)
    Video.create(url: post_params[:url], text: post_params[:text], yt_video_id: yt_video_id, user_id: current_user.id)
    redirect_to action: :index
  end

  def destroy
    video = Video.find(params[:id])
    video.destroy if video.user_id == current_user.id
    redirect_to action: :index
  end

  def show
    @video = Video.find(params[:id])
    @comments = @video.comments.includes(:user)
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    video = Video.find(params[:id])
    yt_video_id = post_params[:url].gsub(/https:\/\/www.youtube.com\/watch\?v=(\w+)/){$1}.slice(0..10)
    video.update(url: post_params[:url], text: post_params[:text], yt_video_id: yt_video_id) if video.user_id == current_user.id
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
