module SessionsHelper
  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def current_user_id
    current_user.nil? ? nil : current_user.id
  end

  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def require_user!
    redirect_to sessions_url if current_user.nil?
  end
end
