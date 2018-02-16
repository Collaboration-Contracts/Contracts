module ApplicationHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

# TODO: needs updated to still show on register page. form id's are an issue.
  def show_login_links?
    controller_name != "sessions" && controller_name != "users"
  end
end
