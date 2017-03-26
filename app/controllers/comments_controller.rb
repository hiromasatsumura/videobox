class CommentsController < ApplicationController
  def create
    Comment.create(comment: comment_params[:comment], video_id: params[:post_id], user_id: current_user.id)
    redirect_to "/posts"
  end

  private
  def comment_params
    params.permit(:comment, :video_id)
  end
end
