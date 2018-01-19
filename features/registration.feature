Feature:	In order to be able to save and work with my contracts
          As a visitor to CC
          I want to register an account

Scenario: register with username and password
	When I register with a username and with a password
	Then I have an account

Scenario: don't register without a username and with a password
  When I register without a username and with a password
  Then I am not registered
	And I view the Registration form

Scenario: don’t register with a username and without a password
  When I register with a username and without a password
  Then I am not registered
	And I view the Registration form
