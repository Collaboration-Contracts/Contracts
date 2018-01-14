Feature: Home Page
  In order to confirm the basic application is working
  As a developer
  I want to confirm the home page is functioning

Scenario: I do not see 'stinky poo'
  Given I am on the homepage
  Then I should not see the text 'stinky poo'

Scenario: I do see 'Hello world'
  Given I am on the homepage
  Then I should see the text 'Hello world'
