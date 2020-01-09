# frozen_string_literal: true

module LikesHelper
  def like_or(post)
    like = Like.liked?(post, current_user)
    if like
      button_to 'Dislike', like_path(like), method: :delete
    else
      render 'likes/like_form', post: post
    end
  end
end
