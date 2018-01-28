require 'rails_helper'
require 'helpers/session_helper'

RSpec.describe SessionsController do

  # this is the 'get' login route
  describe "GET #new" do
    before { get :new }

    it { should route(:get, '/login').
         to(controller: :sessions, action: :new)
    }

    it { should render_template 'new' }
  end

  # This is the post 'login' route
  describe "POST #create" do
    it { should route(:post, '/login').
         to(controller: :sessions, action: :create)
    }


    before do
      register_user("TheEdge","password")
      @params_wo_password = { :session => {:username => "TheEdge" }}
      @params_wo_username = { :session => { :password => "password" }}
      @wrong_username = { :session => {:username => "NotTheEdge", :password => "password" }}
      @wrong_password = { :session => {:username => "TheEdge", :password => "not_password" }}
    end

    context "with correct username and correct password" do
      before { post_session_params("TheEdge", "password") }
      it { should set_session[:user_id].to @user.id }
    end

    context "with incorrect params" do
      it "sets flash message for incorrect username" do
        post :create, params: @wrong_username
        expect(flash[:danger]).to eq([INVALID_LOGIN])
        assert_redirect
      end

      it "sets flash message for incorrect password" do
        post :create, params: @wrong_password
        expect(flash[:danger]).to eq([INVALID_LOGIN])
        assert_redirect
      end

      it "sets flash message for missing username" do
        post :create, params: @params_wo_username
        expect(flash[:danger]).to eq([BLANK_LOGIN_PARAMS])
        assert_redirect
      end

      it "sets flash message for missing password" do
        post :create, params: @params_wo_password
        expect(flash[:danger]).to eq([BLANK_LOGIN_PARAMS])
        assert_redirect
      end

      it "sets flash message for missing params" do
        post :create, params: {:session => {username: "", password: ""}}
        expect(flash[:danger]).to eq([BLANK_LOGIN_PARAMS])
        assert_redirect
      end
    end
  end

end
