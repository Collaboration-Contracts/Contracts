class ContractsController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @page_title = "Dashboard"
    render 'dashboard'
  end
end
