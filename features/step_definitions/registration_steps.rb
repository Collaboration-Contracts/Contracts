When("I register with a username") do
  visit register_path
  fill_in 'username', with: "Bono"
  click_button("Register")
end

Then("I have an account") do
  expect(User.find_by(username: "Bono")).to be_truthy
end

When("I register with a username and with a password") do
  visit register_path
  fill_in 'username', with: "Bono"
  fill_in 'password_digest', with: "password"
  click_button("Register")
end

When("I register without a username and with a password") do
  visit register_path
  fill_in 'password_digest', with: "password"
  click_button("Register")
end

Then("I view the Registration form") do
  expect(User.find_by(username: "Bono")).to be_falsey
  find("form#new_user")
end

When("I register with a username and without a password") do
  visit register_path
  fill_in 'username', with: "Bono"
  click_button("Register")
end
