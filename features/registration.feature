Feature:	In order to prevent other people from seeing my contracts
  As a visitor to CC
  I want to securely login to my account

@wip
Scenario: register with username
	When I register with a username
  Then I have an account

@devready
Scenario: register with username and password
	When I register with a username and with a password
	Then I have an account

@devready
Scenario: don't register without a username and with a password
  When I register without a username and with a password
	Then I view the Registration form

@devready
Scenario: don’t register with a username and without a password
  When I register with a username and without a password
	Then I view the Registration form
