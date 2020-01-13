# frozen_string_literal: true

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

    return false unless friendship&.receiver == current_user

    if friendship&.destroy
      flash[:success] = 'You are no longer friends...'
    else
      flash[:error] = 'Sorry, but bffs forever'
    end
    redirect_to request.referer
  end

  def update
    friendship = Friendship.find(params[:id])

    return false unless friendship&.receiver == current_user

    if friendship&.update_attribute('status', params[:friendship][:status])
      if params[:friendship][:status] == true
        flash[:success] = 'You are now friends!'
      elsif params[:friendship][:status] == false
        flash[:success] = 'User blocked succesfully...'
      end
    else
      flash[:error] = 'Error updating friend status'
    end
    redirect_to request.referer
  end

  def index
    @requests = current_user.received_requests
  end

  def friends
    @friends = current_user.friends(current_user)
  end

  private

  def friendship_params
    params.require(:friendship).permit(:sender_id, :receiver_id)
  end
end
