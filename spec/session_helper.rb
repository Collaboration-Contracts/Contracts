def create_valid_user
  @user = User.create({username: "TheEdge", password: "password"})
end

def post_session_params(username, password)
  post :create, params: { session: { username: username, password: password }}
end

def assert_redirect
  expect(@resopnse).to redirect_to(login_path)
end
