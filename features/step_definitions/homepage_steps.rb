When("I go to the homepage") do
  visit root_path
end

Then("I should not see the text {string}") do |string|
   page.assert_no_text(string)
end
