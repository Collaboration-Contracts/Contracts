require 'rails_helper'

RSpec.describe ContractsController do

  describe "Get index" do
    before do
      get :index
    end
    it "renders dashboard partial" do
      expect(response).to render_template("contracts/dashboard")
    end
    xit "assigns @user" do
      expect(assigns(:user)).to be_kind_of(User)
    end
  end
end
