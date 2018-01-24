Given("I have registered an account") do
  User.create(:username => "Bono", :password => "password")
end

When("I login with a registered username and password") do
  visit login_path
  fill_in 'username', with: "Bono"
  fill_in 'password', with: "password"
  click_button("Login")
end

Then("I view the CC dashboard") do
  page.assert_text("Dashboard")
end

When("I login with a non-registered username and password") do
  visit login_path
  fill_in 'username', with: "Not Bono"
  fill_in 'password', with: "password"
  click_button
end

Then("I view the Login form") do
  find("div.login_form")
end

Then("see a bad username or password error message") do
  page.assert_text(INVALID_LOGIN)
end

When("I login with a registered username and no password") do
  visit login_path
  fill_in 'username', with: "Bono"
  click_button
end

Then("see a blank password error message") do
  page.assert_text(BLANK_PASSWORD)
end

Then("the password field is blank") do
  find_field("password").value.blank?
end

When("I login with no username and a registered password") do
  visit login_path
  fill_in 'password', with: "password"
  click_button
end

Then("see a blank username error message") do
  page.assert_text(BLANK_USERNAME)
end

When("I login with a registered username and a non-matching password") do
  visit login_path
  fill_in 'username', with: 'Bono'
  fill_in 'password', with: 'Not password'
  click_button
end
