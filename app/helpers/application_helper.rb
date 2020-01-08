module ApplicationHelper
  def navbar_auth
    if user_signed_in?
      (link_to 'Log-off |', destroy_user_session_path, :method => :delete).concat(link_to ' Posts |', posts_path).concat(link_to ' New Post |', new_post_path).concat(link_to " Users | ", users_path).concat(link_to " Logged as: #{current_user.first_name}", user_path(current_user))
    else
      (link_to 'Log-in |', new_user_session_path).concat(link_to ' Sign-up', new_user_registration_path)
    end
  end
end
