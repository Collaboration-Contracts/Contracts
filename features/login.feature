Feature:	In order to prevent other people from seeing my contracts
          As a visitor to CC
          I want to securely login to my account

  Scenario: login pop-up has title
    When I am on the login pop-up
    Then I view "Login" in the pop-up title

  Scenario: login from homepage and stay on homepage
    Given I have registered an account
    And I am on the homepage
    When I login with a registered username and password
    Then I am still on the homepage
    And I cannot login again

  Scenario: login attempt with non-registered username and password
    Given I have registered an account
    When I login with a non-registered username and password
    Then I view the Login form
    And I see a bad username or password error message

  Scenario: login attempt with username and no password
    Given I have registered an account
    When I login with a registered username and no password
    Then I view the Login form
    And I see a blank password error message
    And I see a blank password field

  Scenario: login attempt with no username and with a password
    Given I have registered an account
    When I login with no username and a registered password
    Then I view the Login form
    And I see a blank username error message
    And I see a blank password field

#TODO: Review with Diane & maybe Doc how to separate page vs modal
  Scenario: login attempt with non-matching username and password
  # added When I am on the login page to add reusability  .to
    # When I login with registered username and non....
    When I am on the login page
    Given I have registered an account
    When I login with a registered username and a non-matching password
    Then I view the Login form
    And I see a bad username or password error message
    And I see a blank password field

  Scenario: login from homepage and see my username
    Given I have registered an account
    And I am on the homepage
    When I login with a registered username and password
    Then I see that I am the current user

  Scenario: login error messages do not show up on page refresh
    When I am on the login pop-up
    Given I login with a registered username and a non-matching password
    And I refresh the page
    Then I do not see a bad username or password error message
