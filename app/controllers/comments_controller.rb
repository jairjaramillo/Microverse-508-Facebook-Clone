class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @commenter = current_user
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
