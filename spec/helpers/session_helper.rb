def register_user(username, password)
  @user = User.create({username: username, password: password})
end

def post_session_params(username, password)
  post :create, params: { session: { username: username, password: password }}
end

def assert_redirect
  expect(@resopnse).to redirect_to(login_path)
end

def redirects_w_message
  expect(flash[:danger]).to be_truthy
  assert_redirect
end

def set_invalid_params_options
  return { :params_wo_password => { :session => {:username => "TheEdge" }},
    :params_wo_username => { :session => { :password => "password" }},
    :wrong_username => { :session => {:username => "NotTheEdge", :password => "password" }},
    :wrong_password => { :session => {:username => "TheEdge", :password => "not_password" }}
  }
end
