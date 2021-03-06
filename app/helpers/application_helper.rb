module ApplicationHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def current_username
    unless current_user
      "Username"
    else
      current_user.username
    end
  end

  def on_login?
    controller_name == "sessions"
  end

  def on_reg?
    controller_name == "users"
  end

  def or?
    (on_login? || on_reg?) ? "" : " or "
  end
end
