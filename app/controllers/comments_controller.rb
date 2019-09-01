
class CommentsController < ApplicationController
  
  before_action :authenticate_user!

  def create
    @commentable = commentable
    @comment = @commentable.comments.create(comment_params)
    commentable_type = @comment.commentable_type.downcase
    redirect_to send("#{commentable_type}_path", @commentable)
  end
 
  def destroy
    @commentable = commentable
    @comment = @commentable.comments.find(params[:id])
    commentable_type = @comment.commentable_type.downcase
    @comment.destroy
    redirect_to send("#{commentable_type}_path", @commentable)
  end
 
  private

  def commentable
    return Article.find(params[:article_id]) if params[:article_id]
    Profile.find params[:profile_id] if params[:profile_id]
  end

  def comment_params
    params.require(:comment).permit(:body).merge(commenter: current_user)
  end
end