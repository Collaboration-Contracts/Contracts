module HomeHelper

  def disabled_btn?
    current_user ? false : true
  end

end
