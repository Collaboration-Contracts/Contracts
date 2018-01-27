require 'rails_helper'
require 'user_helper'

RSpec.describe User, type: :model do

# test the user's attributes on the DB itself
  [:username, :password_digest].each do |col|
    it { should have_db_column(col).of_type(:string).with_options(null: false) }
    it { should validate_presence_of(col) }
  end

# test the length validations for username
  it { should validate_length_of(:username).
       is_at_least(MIN_USERNAME_LENGTH).
       with_message(INVALID_USERNAME)
     }

  it { should validate_length_of(:username).
       is_at_most(MAX_USERNAME_LENGTH).
       with_message(INVALID_USERNAME)
     }

# test a list of presumably valid usernames
  VALID_USERNAME_ARRAY.each do |username|
    it { should allow_values(username).for(:username) }
  end

# test a list of presumably invalid usernames
  INVALID_USERNAME_ARRAY.each do |username|
    it {should_not allow_values(username).for(:username)}
  end

# tests all the methods provided by the #has_secure_password method
# brought to us by the bcrypt gem
  it { should have_secure_password }

# this creates a dummy user, then creates another one with the same
# value for whatever we are validating uniquness of
  it do
    create_valid_user
    should validate_uniqueness_of(:username)
  end

# Commenting out because #have_secure_password is already testing all of this
  # describe "password encryption" do
  #   before do
  #     create_valid_user
  #   end
  #
  #   it "encrypts given password" do
  #     expect(@user.password_digest).not_to eq("password")
  #   end
  #
  #   context "authenticating user" do
  #     it "returns true to matching password" do
  #       expect(@user.authenticate("password")).to be_truthy
  #     end
  #
  #     it "returns false to non-matching password" do
  #       expect(@user.authenticate("not password")).to be_falsey
  #     end
  #   end
  # end
end
