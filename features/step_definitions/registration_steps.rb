When("I register with a username") do
  visit register_path
  fill_in 'username', with: "Bono"
  click_button("Create User")
end

Then("I have an account") do
  expect(page).to have_content "Collaboration Contracts"
end

When("I register with a username and password") do
  visit register_path
  fill_in 'username', with: "Bono"
  fill_in 'password_digest', with: "password"
  click_button("Create User")
end
