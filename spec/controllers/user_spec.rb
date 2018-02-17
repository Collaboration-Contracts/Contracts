require 'rails_helper'
require 'helpers/user_helper'

# methods like #post_user_params, #fail_and_redirect, #create_valid_user
# all come from user_helper.rb

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    before { get :new }

# let's make sure the right route takes us to the right action
    it { should route(:get, '/register').
         to(controller: :users, action: :new)
       }

# expect this action produces an @user variable and that it's of User type
    it "assigns @user" do
      expect(assigns(:user)).to be_kind_of(User)
    end

# this will follow convention - testing that the 'users/new' was rendered
    it { should render_template 'new' }
  end


  describe "Post #create" do
    it { should route(:post, '/users').
         to(controller: :users, action: :create)
       }

    context "with an invalid username" do
      INVALID_USERNAME_ARRAY.each do |username|
        it "does not create a new user: #{username}" do
          post_user_params(username, 'password')
          expect(User.count).to eq(0)
          expect(User.find_by(username: username)).to be_falsey
        end

        it "sets the flash message for invalid username" do
          post_user_params(username, 'password')
          expect(flash[:danger]).to eq([INVALID_USERNAME])
        end
      end
    end

    context "with a valid username" do
      VALID_USERNAME_ARRAY.each do |username|
        it "does create a new user: #{username}" do
          post_user_params(username, 'password')
          expect(User.count).to eq(1)
          expect(User.find_by(username: username)).to be_truthy
        end

        it "doesn't set any flash message" do
          post_user_params(username, 'password')
          expect(flash[:danger]).to be_falsey
        end

        it "redirects to the homepage" do
          post_user_params(username, 'password')
          expect(response).to redirect_to(root_path)
        end
      end
    end

    context "with an invalid password" do
      before { post_user_params("TheEdge","a1b2c") }
      fail_and_redirect("TheEdge")
    end

    context "with existing username" do
      before { create_valid_user && post_user_params('TheEdge', 'password') }
      it "sets flash message" do
        expect(flash[:danger]).to be_truthy
      end

      it { should redirect_to register_path }
    end

    context "without a username, with a password" do
      before { post_user_params(nil, 'password') }
      fail_and_redirect(nil)
    end

    context "with a username, without a password" do
      before { post_user_params("TheEdge", nil) }
      fail_and_redirect("TheEdge")
    end
  end

end
