class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )

    if user.nil?
      # probably should flash errors, but it's late and I'm lazy.
      render :new 
      return
    else
      login_user!(user)
      redirect_to cats_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil

    redirect_to new_session_url
  end

  def new
    render :new
  end
end
