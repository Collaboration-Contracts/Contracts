class UsersController < ApplicationController
  protect_from_forgery with: :exception
  after_action :clear_flash, only: [:create], if: -> { @from_js }

  def new
    @page_title = "Registration"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      if request.xhr?
        render json: {
          message: "Register Successful",
          :avatar_corner => render_to_string('partials/_avatar_corner', :layout => false),
          :sidemenu => render_to_string('partials/_sidemenu_content', :layout => false),
          status: 204 }
      else
        redirect_to root_path
      end

    else
      flash[:danger] = @user.custom_error_messages

      if request.xhr?
        render :json => { :attachmentPartial => render_to_string('partials/_flash', :layout => false), status: 422 }
        @from_js = true
      else
        redirect_to register_path
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def clear_flash
    flash.delete(:danger)
  end
end
