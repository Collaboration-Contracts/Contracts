class UsersController < ApplicationController
  protect_from_forgery with: :exception

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to dashboard_path
    else
      flash[:danger] = @user.custom_error_messages
      redirect_to register_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
