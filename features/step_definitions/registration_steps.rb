Given("I am on the registration page") do
  visit register_path
end
#TODO: This step is not working, not sure why. wip
 When("I enter a username") do
  #fill_in 'user[username]', :with => 'Bono', visible: false
 fill_in 'username', with: "bono"
 submit_form
end

Then("I have an account") do
  expect(page).to have_content "Welcome, Bono"
end
