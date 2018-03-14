Given("I am not logged in") do
  visit root_path
  page.assert_text("Login or Register")
end

When("I am on the Contract page") do
  visit root_path
end

Then("I see the disabled Save button") do
  expect(page).to have_button('Save', disabled: true)
end

And("I see the Login and Register links on the Contract page") do
  expect(page.find('.save-contract-options')).to have_selector(".user-links")
end

And("I see the Login and Register links in the nav menu") do
  expect(page.find('.sidemenu-content')).to have_selector(".user-links")
end
