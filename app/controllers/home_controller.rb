class HomeController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @page_title = "Collaboration Contracts"
    render 'contracts/new'
  end

end
