Feature:	In order to prevent other people from seeing my contracts
  As a visitor to CC
  I want to securely login to my account

Scenario: register with username
  Given I am on the registration page
	When I enter a username
  Then I have an account
