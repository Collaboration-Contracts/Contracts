Feature:  In order to be able to save and work with my contracts
          As a visitor to CC
          I want to register an account


  Scenario: pop-up has title
    When I am on the registration pop-up
    Then I see "Registration" in the pop-up title

  Scenario: register from homepage and stay on homepage
    Given I am on the homepage
    When I register with a valid username and password
    Then I have an account
    And I am still on the homepage
    And I cannot register again

  Scenario: register from homepage and see my username
    Given I am on the homepage
    When I register with a valid username and password
    When I register
    Then I see that I am the current user
    # The username should be displayed next to the user icon

  Scenario: register with username and password
    Given I enter a username
    And I enter a password
    When I register
    Then I have an account

  Scenario: register error messages do not show up on page refresh
    Given I register with a registered username and password
    When I register with a valid username and password
    And I refresh the page
    Then I do not see an existing username error message

  Scenario Outline: no account with blank username and/or password
    Given I enter '<username>' for the username
    And I enter '<password>' for the password
    When I register
    Then I do not have an account
    And I see a required fields error message

    Examples:
      | username  | password  |
      |           | Ermahgerd |
      | LMullen   |           |
      |           |           |

  Scenario Outline: register with valid username
    Given I enter '<valid_username>' for the username
    And I enter a password
    When I register
    Then I have an account as '<valid_username>'

    Examples:
      | valid_username       |
      | CareBear             |
      | A1B2C3D4E5F6G7H8I9J0 |
      | Bond007              |
      | 8675309              |
      | A1B2C3               |

  Scenario Outline: don't register & error with invalid username
    Given I enter '<invalid_username>' for the username
    And I enter a password
    When I register
  	Then I do not have an account
    And I see an invalid username error message

    Examples:
      | invalid_username       |
      | dog                    |
      | GrandMasterFunkMeister |
      | I.am.batman.           |

  Scenario: don't register & error if username already exists
    Given the username 'CareBear' exists
    And I enter 'CareBear' for the username
    And I enter a password
    When I register
    Then I do not have an account
    And I see an existing username error message

  Scenario: don't register & error with invalid password
    Given I enter a username
    And I enter 'Bono' for the password
    When I register
  	Then I do not have an account
    And I see an invalid password error message
