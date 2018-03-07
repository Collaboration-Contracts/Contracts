Feature:	In order to prevent other people from seeing my contracts
          As a visitor to CC
          I want to securely login to my account

@dev_ready
Scenario: login pop-up has title
  When I am on the login pop-up
  Then I see "Login" in the pop-up title

@dev_ready
Scenario: login from homepage and stay on homepage
  Given I have registered an account
  And I am on the homepage
  When I login with a registered username and password
  Then I am on the homepage
  And I cannot login again
#basically we want to confirm that the login link is gone in the nav menu

#this one should break once we complete login/register from nav menu
@dev_ready
Scenario: login with username and password
  Given I have registered an account
  When I login with a registered username and password
  Then I see the CC dashboard

Scenario: login attempt with non-registered username and password
  Given I have registered an account
	When I login with a non-registered username and password
	Then I see the Login form
  And I see a bad username or password error message

Scenario: login attempt with username and no password
  Given I have registered an account
	When I login with a registered username and no password
	Then I see the Login form
  And I see a blank password error message
  And I see a blank password field

Scenario: login attempt with no username and with a password
  Given I have registered an account
	When I login with no username and a registered password
	Then I see the Login form
  And I see a blank username error message
  And I see a blank password field

Scenario: login attempt with non-matching username and password
  Given I have registered an account
	When I login with a registered username and a non-matching password
	Then I see the Login form
  And I see a bad username or password error message
  And I see a blank password field
