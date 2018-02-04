Given("I have registered an account") do
  User.create(:username => "TheEdge", :password => "password")
end

When("I login with a registered username and password") do
  visit login_path
  fill_in 'username', with: "TheEdge"
  fill_in 'password', with: "password"
  click_button("Login")
end

Then("I view the CC dashboard") do
  page.assert_text("Dashboard")
end

When("I login with a non-registered username and password") do
  visit login_path
  fill_in 'username', with: "Not TheEdge"
  fill_in 'password', with: "password"
  click_button
end

Then("I view the Login form") do
  find("div.login-form")
end

And("I see a bad username or password error message") do
  page.assert_text(INVALID_LOGIN)
end

When("I login with a registered username and no password") do
  visit login_path
  fill_in 'username', with: "TheEdge"
  click_button
end

And("I see a blank password error message") do
  page.assert_text(BLANK_LOGIN_PARAMS)
end

And("I see a blank password field") do
  find_field("password").value.blank?
end

When("I login with no username and a registered password") do
  visit login_path
  fill_in 'password', with: "password"
  click_button
end

And("I see a blank username error message") do
  page.assert_text(BLANK_LOGIN_PARAMS)
end

When("I login with a registered username and a non-matching password") do
  visit login_path
  fill_in 'username', with: 'TheEdge'
  fill_in 'password', with: 'Not password'
  click_button
end
