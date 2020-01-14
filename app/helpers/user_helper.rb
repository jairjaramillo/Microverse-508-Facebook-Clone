# frozen_string_literal: true

module UserHelper
  def user_gravatar(user)
    gravatar_url = user.image_link
    image_tag(gravatar_url, alt: user.first_name)
  end

  def befriendable?(user)
    friendship = Friendship.between(user, current_user)
    if friendship
      content_tag(:p, 'Pending friend request') if friendship.status.nil?
    else
      render 'friendships/friendship', user: user
    end
  end
end
