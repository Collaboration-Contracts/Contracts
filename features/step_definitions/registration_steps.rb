Given("I am on the registration page") do
  visit register_path
end

 When("I enter a username") do
  page.fill_in 'username', with: "Bono"
  page.click_button("Create User")
end

Then("I have an account") do
  expect(page).to have_content "Collaboration Contracts"
end
