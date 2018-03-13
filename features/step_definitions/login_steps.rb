include WaitForAjax

When ("I am on the login pop-up") do
  visit root_path
  click_link('login-modal-link')
end

Then("I view {string} in the pop-up title") do |string|
  find("##{string.downcase}-modal").find('.modal-title').assert_text(string)
end

And ("I cannot login again") do
  wait_for_ajax
  expect(page).not_to  have_selector('#login-modal-link')
end

Given("I have registered an account") do
  User.create(:username => "TheEdge", :password => "password")
end

When("I am on the login page") do
    visit login_path
end

Then("I see {string} in the page title") do |string|
  within('.page-title') { assert_text(string) }
end

When("I login with a registered username and password") do
  click_link('login-modal-link')
  fill_in 'login-username', with: "TheEdge"
  fill_in 'login-password', with: "password"
  click_button("Login")
end

Then ("I see that I am the current user") do
  page.assert_text("TheEdge")
end

Then("I see the CC dashboard") do
  page.assert_text("Dashboard")
end

When("I login with a non-registered username and password") do
  visit login_path
  fill_in 'login-username', with: "Not TheEdge"
  fill_in 'login-password', with: "password"
  click_button("Login")
end

Then("I see the Login form") do
  find("div.login-form")
end

And("I see a bad username or password error message") do
  page.assert_text(INVALID_LOGIN)
end

When("I login with a registered username and no password") do
  visit login_path
  fill_in 'login-username', with: "TheEdge"
  click_button("Login")
end

And("I see a blank password error message") do
  page.assert_text(BLANK_LOGIN_PARAMS)
end

And("I see a blank password field") do
  find_field("login-password").value.blank?
end

When("I login with no username and a registered password") do
  visit login_path
  fill_in 'login-password', with: "password"
  click_button("Login")
end

And("I see a blank username error message") do
  page.assert_text(BLANK_LOGIN_PARAMS)
end

When("I login with a registered username and a non-matching password") do
  visit login_path
  fill_in 'login-username', with: 'TheEdge'
  fill_in 'login-password', with: 'Not password'
  click_button("Login")
end

# selenium webdriver when added properly I think allows us to do
# something like this: driver.navigate.refresh as well as
# allow for ajax
And ("I refresh the page") do
  # driver.navigate.refresh
  visit URI.parse(current_url)
end

Then("I do not see a bad username or password error message") do
  page.assert_no_text(INVALID_LOGIN)
end
