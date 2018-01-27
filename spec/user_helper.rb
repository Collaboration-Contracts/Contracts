def create_valid_user
  @user = User.create({username: "TheEdge", password: "password"})
end

def post_user_params(username, password)
  post :create, params: { user: { username: username, password: password }}
end

def clear_db_then_post_user_params(username, password)
  User.destroy_all
  post_user_params(username, password)
end

def verify_no_user
  it "does not create a new user" do
    expect{ response }.to change{ User.count }.by(0)
  end
end

def fail_and_redirect
  verify_no_user
  it { should set_flash[:danger] }
  it { should redirect_to register_path }
end
