module ApplicationHelper
  def navbar_auth
    if user_signed_in?
      link_to 'Log-off', destroy_user_session_path, :method => :delete
    else
      (link_to 'Log-in ', new_user_session_path).concat(link_to 'Sign-up', new_user_registration_path)
    end
  end
end
