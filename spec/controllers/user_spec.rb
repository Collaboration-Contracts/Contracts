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
    it "creates a new user" do
      params = { :username => "bono" }
      expect{ post :create, params: params }.to change{ User.count }.by(1)
    end
  end
end
