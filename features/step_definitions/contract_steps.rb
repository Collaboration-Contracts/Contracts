def make_user
  User.create({
    username: "TheEdge",
    password: "password"
    })
end

Given("I enter {string} for the contract title") do |string|
  visit root_path
  make_user
  fill_in 'contract-title', with: string
end

Then("I see {string} for the contract title") do |string|
  expect(find_field('contract-title').value).to eq string
end

Then("I see the Save button") do
  expect(page).to have_button('Save')
end

And("I do not see the Login and Register links on the Contract page") do
  expect(page.find('.save-contract-options')).not_to have_selector(".user-links")
end

And("I do not see the Login and Register links in the nav menu") do
  expect(page.find('.sidemenu-content')).not_to have_selector(".user-links")
end
