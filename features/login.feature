Feature:	In order to prevent other people from seeing my contracts
          As a visitor to CC
          I want to securely login to my account

# REMOVED because registration with only username is not a valid scenario
# Scenario: login with username
# 	Given I register with a username
# 	When I login with that username
# 	Then I view the CC dashboard

Scenario: login with username and password
  Given I have registered an account
	When I login with a registered username and password
	Then I view the CC dashboard

@dev_ready
Scenario: login attempt with non-registered username and password
  Given I have registered an account
	When I login with a non-registered username and password
	Then I view the Login form
  And I see a bad username or password error message

@dev_ready
Scenario: login attempt with username and no password
  Given I have registered an account
	When I login with a registered username and no password
	Then I view the Login form
  And I see a blank password error message
  And I see a blank password field

@dev_ready
Scenario: login attempt with no username and with a password
  Given I have registered an account
	When I login with no username and a registered password
	Then I view the Login form
  And I see a blank username error message
  And I see a blank password field

@dev_ready
Scenario: login attempt with non-matching username and password
  Given I have registered an account
	When I login with a registered username and a non-matching password
	Then I view the Login form
  And I see a bad username or password error message
  And I see a blank password field
