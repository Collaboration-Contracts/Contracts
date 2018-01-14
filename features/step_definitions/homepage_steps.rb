Given("I am on the homepage") do
  visit root_path
end

Then("I should not see the text {string}") do |string|
   page.assert_no_text(string)
end

Then("I should see the text {string}") do |string|
   page.assert_text(string)
end
