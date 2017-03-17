class PostsController < ApplicationController
  
  def index
    @videos = Video.order("created_at DESC")
  end

  def new
  end

  def create
    Video.create(username: params[:user_id], video: params[:url], text: params[:text])
  end
end
