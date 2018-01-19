require 'rails_helper'

RSpec.describe SessionsController do

  describe "Get new" do
    before do
      get :new
    end
    it "renders sessions/new page" do
      expect(response).to render_template("sessions/new")
    end
  end

  describe "Post new" do
    before do
      @params = { :user => {:username => "bono", :password_digest => "password" }}
      @params_wo_password = { :user => {:username => "bono" }}
      @params_wo_username = { :user => { :password_digest => "password" }}
      @wrong_username = { :user => {:username => "edge", :password_digest => "password" }}
      @wrong_password = { :user => {:username => "bono", :password_digest => "not_password" }}
      @user = User.create(@params[:user])
    end

    context "with correct username and correct password" do
      before do
        post :new, params: @params
      end
      #TODO: go to sessions controller and write some code dang-it.
      it "creates a new user session" do
        expect(@request.session["user_id"]).to equal(@user.id)
      end
    end


  end

end
