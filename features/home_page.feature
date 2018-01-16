Feature: Home Page
  In order to confirm the basic application is working
  As a member of the project
  I want to confirm the home page is functioning

Scenario: I do not see 'stinky poo'
  Given I am on the homepage
  Then I do not see the text 'stinky poo'

Scenario: I do see 'Hello world'
  Given I am on the homepage
  Then I see the text 'Hello world'
