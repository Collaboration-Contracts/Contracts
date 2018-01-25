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
  Scenario: no account without a username and with a password
    Given I do not enter a username
    And I enter a password
    When I register
    Then I do not have an account
	  And I view the Registration form

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
      | dog                    |
      | GrandMasterFunkMeister |
      | I.am.batman.           |
    And I enter a password
    When I register
  	Then I do not have an account
    And I view the Registration form
    And I see an invalid username error message

@dev_ready
  Scenario: don't register if username already exists
    Given the username 'CareBear' exists
    And I enter the username 'CareBear'
    And I enter a password
    When I register
    Then I do not have an account
    And I view the Registration form
    And I see an existing username error message


#this scenario can replace the 'don't register w/ invalid username" scenario
# once we add error messages for invalid username
#@dev_ready
#  Scenario: display invalid entry username error message
#    When I register with an invalid username and a password
#    | invalid_username       |
#    | dog                    |
#    | GrandMasterFunkMeister |
#    | I.am.batman.           |
#    Then I am not registered
#    And I view the Registration form
#    And I see an invalid entry username error message

#started this but want to finish valid username scenarios first
#@dev_ready
#  Scenario: register with valid username and valid password
#    When I register with a valid username and a valid password
#      | valid_password |
#      | password       |
#    When I register with an
