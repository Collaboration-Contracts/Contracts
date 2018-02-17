class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :set_new_user

  private
    def set_new_user
      @user = User.new()
    end
end
