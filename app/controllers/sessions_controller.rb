class SessionsController < ApplicationController
  #TODO: have review with doc about clearing flash
after_action :clear_flash, only: [:create], if: -> { @from_js }

  def new
    @page_title = "Login"
  end

  def create
    user = User.find_by(username: session_params[:username])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(session_params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js { render json: { :message => "Login Successful", :avatar_corner => render_to_string('partials/_avatar_corner', :layout => false), status: 204 } }
      end
    else
      assign_login_flash_message
      flash[:danger] = [@notice]
      respond_to do |format|
        format.html { redirect_to login_path }
        format.js do
          @from_js = true
          render json: { :attachmentPartial => render_to_string('partials/_flash', :layout => false), status: 422 }
        end
      end
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end

  def clear_flash
    flash.delete(:danger)
  end

  def assign_login_flash_message
    if session_params[:username].blank? || session_params[:password].blank?
      @notice = BLANK_LOGIN_PARAMS
    else
      @notice = INVALID_LOGIN
    end
    return
  end
end
