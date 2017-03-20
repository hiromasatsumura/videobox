class PostsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @videos = Video.includes(:user).order("created_at DESC")
    @video_ids_j = @videos.map {|video| video.video_id}.to_json.html_safe
  end

  def new
  end

  def create
    video_id = post_params[:url].match(/https:\/\/www.youtube.com\/watch\?v=(\w+)/)
    Video.create(url: post_params[:url], text: post_params[:text], video_id: video_id, user_id: current_user.id)
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
