Feature:	In order to prevent other people from seeing my contracts
  As a visitor to CC
  I want to securely login to my account

@wip
Scenario: register with username
	When I register with a username
  Then I have an account

@wip
Scenario: register with username and password
	When I register with a username and password
	Then I have an account

@wip
Scenario: don't register without a username and with a password
  Given I register without a username
	When I register with a password
	Then I view the Registration form

@wip
Scenario: don’t register with a username and without a password
  Given I register with a username
	When I register without a password
	Then I view the Registration form
