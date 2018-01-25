Feature:	In order to be able to save and work with my contracts
          As a visitor to CC
          I want to register an account

#some of these scenarios should break once we require a username to be valid
# since the step defs insert "Bono" which doesn't meet the new criteria
@dev_ready
  Scenario: register with username and password
	  Given I enter a username
    And I enter a password
    When I register
	  Then I have an account

@dev_ready
  Scenario: no account with a username and without a password
    Given I enter a username
    And I do not enter a password
    When I register
    Then I do not have an account
	  And I view the Registration form

@dev_ready
  Scenario: register with valid username
    Given I enter a valid username
      | CareBear             |
      | Bond007              |
      | 8675309              |
      | A1B2C3               |
      | A1B2C3D4E5F6G7H8I9J0 |
    And I enter a password
	  When I register
    Then I have an account

@dev_ready
  Scenario: don't register with invalid username
    Given I enter an invalid username
      |                        |
      | dog                    |
      | GrandMasterFunkMeister |
      | I.am.batman.           |
    And I enter a password
    When I register
  	Then I do not have an account
    And I view the Registration form

@dev_ready
  Scenario: don't register if username already exists
    Given the username 'CareBear' exists
    And I enter the username 'CareBear'
    And I enter a password
    When I register
    Then I do not have an account
    And I view the Registration form


#these scenarios can replace the 'don't register w/ invalid username"
# and "if username already exists" scenarios
# once we add the error messages
#@dev_ready
  # Scenario: don't register & error with invalid username
  #   Given I enter an invalid username
  #     | dog                    |
  #     | GrandMasterFunkMeister |
  #     | I.am.batman.           |
  #   And I enter a password
  #   When I register
  # 	Then I do not have an account
  #   And I view the Registration form
  #   And I see an invalid username error message

  # @dev_ready
  #   Scenario: don't register & error if username already exists
  #     Given the username 'CareBear' exists
  #     And I enter the username 'CareBear'
  #     And I enter a password
  #     When I register
  #     Then I do not have an account
  #     And I view the Registration form
  #     And I see an existing username error message
