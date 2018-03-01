require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do

  describe "current_user" do
    context "with user signed in" do
      before do
        @user = User.create({username: "TheEdge", password: "password"})
        session[:user_id] = @user.id
      end
      it "returns a user" do
          expect(current_user).to eq(@user)
      end
    end

    context "with no user signed in" do
      it "returns nil" do
          expect(current_user).to be(nil)
      end
    end
  end
end
