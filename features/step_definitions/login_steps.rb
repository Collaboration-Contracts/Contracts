When("I login with a registered username and password") do
  visit login_path
  fill_in 'username', with: "Bono"
  fill_in 'password_digest', with: "password"
  click_button("Login")
end

Then("I view the CC dashboard") do
  page.assert_text("Dashboard")
end
