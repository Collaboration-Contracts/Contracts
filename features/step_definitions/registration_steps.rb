Given("I enter a username") do
  visit register_path
  fill_in 'username', with: "TheEdge"
end

And("I enter a password") do
  fill_in 'password', with: "password"
end

When ("I register") do
  click_button("Register")
end

Then ("I have an account") do
  expect(User.count).to eq(1)
end

And ("I do not enter a password") do
  fill_in 'password', with: ""
end

Then ("I do not have an account") do
  expect(User.find_by(username: "TheEdge")).to be_falsey
end

And("I view the Registration form") do
  find("form#new_user")
end

Given (/^I enter a valid (.*)$/) do |username|
  visit register_path
  fill_in 'username', with: username
end

Given (/^I enter an invalid (.*)$/) do |username|
  visit register_path
  fill_in 'username', with: username
end

Then(/^I have an account as (.*)$/) do |username|
    expect(User.find_by(username: username)).to be_truthy
end

Then(/^I do not have an account as (.*)$/) do |username|
    expect(User.find_by(username: username)).to be_falsey
end

Given ("the username {string} exists") do |username|
  User.create(username: username, password: 'password')
end

And ("I enter the username {string}") do |username|
  visit register_path
  fill_in 'username', with: username
end



#
# For example, say you have this:
#
# ===============================
#   Scenario: Test it out
#   Given I do something to with
#       | Setting | Value |
#       | Some Setting | Some Value |
# ===============================
#
# and you have a matcher like this
#
# ===============================
# Given (/I do something to with$/) do |table|
#   puts ("Table: #{table}")
#   puts ("Table class: #{table.class}")
# end
# ===============================
#
# You will get this output:
#
# ===============================
#    Given I do something to with
#       Specifics:
#         |     Setting      |     Value      |
#         |     Some Setting |     Some Value |
#       Specifics class: Cucumber::Ast::Table
