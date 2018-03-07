Given("I enter a username") do
  visit register_path
  fill_in 'username', with: "TheEdge"
end

When("I am on the registration page") do
    visit register_path
end

# same test ran in login_steps is being checked here
# Then("I see {string} in the page title") do |string|
#   within('.page-title') { assert_text(string) }
# end

And("I enter a password") do
  fill_in 'password', with: "password"
end

When ("I register") do
  @pre_register_user_count = User.count
  click_button("Register")
end

Then ("I have an account") do
  expect(User.count).to eq(1)
end

And ("I do not enter a password") do
  fill_in 'password', with: ""
end

Then ("I do not have an account") do
  expect(@pre_register_user_count).to eq(User.count)
end

And("I enter {string} for the username") do |username|
  visit register_path
  fill_in 'username', with: username
end

And ("I enter {string} for the password") do |password|
  visit register_path
  fill_in 'password', with: password
end

Then("I have an account as {string}") do |username|
    expect(User.find_by(username: username)).to be_truthy
end

Given("the username {string} exists") do |username|
  @user_id = User.create(username: username, password: 'password').id
end

And("I see a required fields error message") do
  page.assert_text(BLANK_REGISTER_PARAMS)
end

And("I see an invalid password error message") do
    page.assert_text(INVALID_PASSWORD)
end

And("I see an invalid username error message") do
  page.assert_text(INVALID_USERNAME)
end

And("I see an existing username error message") do
  page.assert_text(EXISTING_USERNAME)
end
