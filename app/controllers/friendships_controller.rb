class FriendshipsController < ApplicationController
  protect_from_forgery prepend: true

  def create
    friendship = Friendship.new(friendship_params)

    if friendship.save
      flash[:success] = 'Friend request sent!'
    else
      flash[:error] = 'Error sending friend request'
    end
    redirect_to request.referer
  end

  def destroy
    friendship = Friendship.find(params[:id])

    return false unless friendship&.user == current_user

    if friendship&.destroy
      flash[:success] = 'You are no longer friends...'
    else
      flash[:error] = 'Sorry, but bffs forever'
    end
    redirect_to request.referer
  end

  def update
    friendship = Friendship.find(params[:id])

    return false unless friendship&.user == current_user

    new_status = params[:friendship][:status]

    if friendship&.update(status: new_status)
      if new_status == true
        flash[:success] = 'You are now friends!'
      elsif new_status == false
        flash[:success] = 'User blocked succesfully...'
      end
    else
      flash[:error] = 'Error updating friend status'
    end
    redirect_to request.referer
  end

  private

  def friendship_params
    params.require(:friendship).permit(:sender_id, :receiver_id)
  end
end
