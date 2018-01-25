require 'rails_helper'

RSpec.describe User, type: :model do
  string_columns = [:username, :password_digest]

  string_columns.each do |col|
    it { should have_db_column(col).of_type(:string).with_options(null: false) }
    it { should validate_presence_of(col) }
  end

  it { should validate_length_of(:username).is_at_least(MIN_USERNAME_LENGTH)}
  it { should validate_length_of(:username).is_at_most(MAX_USERNAME_LENGTH)}

  it do
    User.create({username: "TheEdge", password: "password"})
    should validate_uniqueness_of(:username) 
  end


  describe "password encryption" do
    before do
      @user = User.create({username: "TheEdge", password: "password"})
    end

    it "encrypts given password" do
      expect(@user.password_digest).not_to eq("password")
    end

    context "authenticating user" do
      it "returns true to matching password" do
        expect(@user.authenticate("password")).to be_truthy
      end

      it "returns false to non-matching password" do
        expect(@user.authenticate("not password")).to be_falsey
      end
    end
  end
end
