module UserHelper
  def user_gravatar(user)
    gravatar_url = user.image_link
    image_tag(gravatar_url, alt: user.first_name)
  end
end
