class LikesController < ApplicationController
  def create
    like = Like.new(like_params)

    if like.save
      flash[:success] = 'Liked!'
    else
      flash[:success] = 'Error, could not like post' 
    end
    redirect_to request.referer
  end

  def destroy
    like = Like.find(params[:id])

    return false unless like&.user == current_user

    if like&.destroy
      flash[:success] = 'Disliked...'
    else
      flash[:error] = 'Sorry, you\'ll like this forever'
    end
    redirect_to request.referer
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
