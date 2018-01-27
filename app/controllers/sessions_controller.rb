class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: session_params[:username])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(session_params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      # If user's login doesn't work, send them back to the login form
      assign_login_flash_message
      flash[:danger] = [@notice]
      redirect_to login_path
    end
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end

  def assign_login_flash_message
    if session_params[:username].blank? && session_params[:password].blank?
      @notice = BLANK_LOGIN_PARAMS
    elsif session_params[:username].blank?
      @notice = BLANK_USERNAME
    elsif session_params[:password].blank?
      @notice = BLANK_PASSWORD
    else
      @notice = INVALID_LOGIN
    end
  end
end
