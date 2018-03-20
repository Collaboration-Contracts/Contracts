class HomeController < ApplicationController
  include HomeHelper
  protect_from_forgery with: :exception

  def index

  end

end
