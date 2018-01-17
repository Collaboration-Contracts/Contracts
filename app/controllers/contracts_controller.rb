class ContractsController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    render 'dashboard'
  end
end
