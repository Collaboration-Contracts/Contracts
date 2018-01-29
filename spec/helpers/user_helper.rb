def create_valid_user
  @user = User.create({username: "TheEdge", password: "password"})
end

def post_user_params(username, password)
  post :create, params: { user: { username: username, password: password }}
end

def verify_no_user(username)
  it "does not create a new user" do
    expect(User.count).to eq(0)
    expect(User.find_by(username: username)).to be_falsey
  end
end

def fail_and_redirect(username)
  verify_no_user(username)
  it "should set a flash message" do
    expect(flash[:danger]).to be_truthy
  end
  it { should redirect_to register_path }
end
