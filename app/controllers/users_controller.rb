class UsersController < ActionController::Base
  protect_from_forgery with: :exception

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to dashboard_path
  end

  private
  def user_params()
    params.permit(:username)
  end
end
