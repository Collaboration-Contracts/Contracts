require 'rails_helper'

RSpec.describe ContractsController do

  describe "Get index" do
    before do
      get :index
    end
    it "renders dashboard partial" do
      expect(response).to render_template("contracts/dashboard")
    end

  end
end
