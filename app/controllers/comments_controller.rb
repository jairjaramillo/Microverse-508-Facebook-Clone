# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @commenter = current_user
    @comment = @commenter.comments.build(comment_params)
    post = Post.find(params[:comment][:post_id])

    if @comment.save
      flash[:success] = 'Comment successfully added'
      redirect_to post_path(post)
    else
      flash[:error] = 'Error saving comment :-('
      redirect_to request.referer
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    return false unless @comment&.commenter == current_user

    if @comment&.destroy
      flash[:success] = 'Comment successfully deleted'
    else
      flash[:error] = 'Error deleting comment :-('
    end
    redirect_to request.referer
  end

  def edit; end

  def update; end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
