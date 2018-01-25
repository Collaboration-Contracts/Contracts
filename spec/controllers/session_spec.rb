require 'rails_helper'

RSpec.describe SessionsController do

  # this is the 'get' login route
  describe "Get new" do
    before do
      get :new
    end
    it "renders sessions/new page" do
      expect(response).to render_template("sessions/new")
    end
  end

  # This is the post 'login' route
  describe "Post create" do
    before do
      @params = { :session => {:username => "TheEdge", :password => "password" }}
      @params_wo_password = { :session => {:username => "TheEdge" }}
      @params_wo_username = { :session => { :password => "password" }}
      @wrong_username = { :session => {:username => "edge", :password => "password" }}
      @wrong_password = { :session => {:username => "TheEdge", :password => "not_password" }}
      @user = User.create(@params[:session])
    end

    context "with correct username and correct password" do
      before do
        post :create, params: @params
      end

      it "creates a new user session with correct user_id" do
        expect(request.session[:user_id]).to equal(@user.id)
      end
    end

    context "with in-correct params" do
      it "sets flash message for incorrect username" do
        post :create, params: @wrong_username
        expect(flash[:danger]).to eq(INVALID_LOGIN)
      end

      it "sets flash message for incorrect password" do
        post :create, params: @wrong_password
        expect(flash[:danger]).to eq(INVALID_LOGIN)
      end

      it "sets flash message for missing username" do
        post :create, params: @params_wo_username
        expect(flash[:danger]).to eq(BLANK_USERNAME)
      end

      it "sets flash message for incorrect password" do
        post :create, params: @params_wo_password
        expect(flash[:danger]).to eq(BLANK_PASSWORD)
      end

      it "sets flash message for blank params" do
        post :create, params: {:session => {username: "", password: ""}}
        expect(flash[:danger]).to eq(BLANK_LOGIN_PARAMS)
      end
    end
  end

end
