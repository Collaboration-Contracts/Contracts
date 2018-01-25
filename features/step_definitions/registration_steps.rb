When("I register with a username") do
  visit register_path
  fill_in 'username', with: "TheEdge"
  click_button("Register")
end

Then("I have an account") do
  expect(User.find_by(username: "TheEdge")).to be_truthy
end

When("I register with a username and with a password") do
  visit register_path
  fill_in 'username', with: "TheEdge"
  fill_in 'password', with: "password"
  click_button("Register")
end

When("I register without a username and with a password") do
  visit register_path
  fill_in 'password', with: "password"
  click_button("Register")
end

Then("I am not registered") do
  expect(User.find_by(username: "TheEdge")).to be_falsey
end

And("I view the Registration form") do
  find("form#new_user")
end

When("I register with a username and without a password") do
  visit register_path
  fill_in 'username', with: "TheEdge"
  click_button("Register")
end
