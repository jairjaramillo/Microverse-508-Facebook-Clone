# frozen_string_literal: true

module PostsHelper
  def who_likes(show_likes, post)
    if show_likes
      content_tag(:h2, 'People who liked this:', id: 'likers') +
      (render partial: 'likes/like', collection: post.likes, as: :user)
    else
      ''
    end
  end
end
