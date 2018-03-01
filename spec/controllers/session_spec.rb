require 'rails_helper'
require 'helpers/session_helper'

RSpec.describe SessionsController do

  # this is the 'get' login route
  describe "GET #new" do
    before { get :new }
    it { should route(:get, '/login').to(controller: :sessions, action: :new) }
    it { should render_template 'new' }
  end

  # This is the post 'login' route
  describe "POST #create" do
    it { should route(:post, '/login').to(controller: :sessions, action: :create) }
    before { register_user("TheEdge","password") }

    context "with correct username and correct password" do
      before { post_session_params("TheEdge", "password") }
      it { should set_session[:user_id].to @user.id }
    end

    context "with incorrect params" do
      set_invalid_params_options.each do |k,v|
        it "sets flash and redirects: #{k}" do
          post :create, params: v
          redirects_w_message
        end
      end
    end
  end

  describe "GET #destroy" do
    it { should route(:get, '/signout').to(controller: :sessions, action: :destroy) }
    
    before do
      register_user("TheEdge","password")
      post_session_params("TheEdge", "password")
    end

    it "deletes session user_id" do
      expect{get :destroy}.to change{session[:user_id]}.to(nil)
    end
  end
end
