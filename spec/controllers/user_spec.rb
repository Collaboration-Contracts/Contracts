require 'rails_helper'

RSpec.describe UsersController do
  describe "GET new" do
    it "assigns @user" do
      get :new
      expect(assigns(:user)).to be_kind_of(User)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("users/new")
    end
  end

  describe "Post create" do
    before do
      @params = { :user => {:username => "bono", :password_digest => "password" }}
      @params_wo_password = { :user => {:username => "bono" }}
      @params_wo_username = { :user => { :password_digest => "password" }}
    end

    # REMOVED - changed schema to require password
    # context "without a password" do
    #   it "creates a new user" do
    #     expect{ post :create, params: @params }.to change{ User.count }.by(1)
    #   end
    #   it "redirects to contract dashboard" do
    #     post :create, params: @params
    #     expect(response).to redirect_to(dashboard_path)
    #   end
    # end

    context "with a password" do
      it "creates a new user" do
        expect{ post :create, params: @params }.to change{ User.count }.by(1)
      end
      it "redirects to contract dashboard" do
        post :create, params: @params
        expect(response).to redirect_to(dashboard_path)
      end
    end

    context "without a username, with a password" do
      it "does not create a new user" do
        expect { post :create, params: @params_wo_username}.to change{ User.count }.by(0)
      end

      it "redirects to the register page" do
        post :create, params: @params_wo_username
        expect(response).to redirect_to(register_path)
      end
    end

    context "with a username, without a password" do
      it "does not create a new user" do
        expect { post :create, params: @params_wo_password}.to change{ User.count }.by(0)
      end

      it "redirects to the register page" do
        post :create, params: @params_wo_password
        expect(response).to redirect_to(register_path)
      end
    end
  end

end
