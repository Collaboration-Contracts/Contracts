Feature:	In order to be able to save and work with my contracts
          As a visitor to CC
          I want to register an account

#some of these scenarios should break once we require a username to be valid
# since the step defs insert "Bono" which doesn't meet the new criteria
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

@dev_ready
  Scenario: register with valid username
    When I register with a valid username and a password
      | valid_username |
      | CareBear       |
      | Bond007        |
      | 8675309        |
	  Then I have an account

@dev_ready
  Scenario: don't register with invalid username
    When I register with an invalid username and a password
      | invalid_username       |
      | dog                    |
      | GrandMasterFunkMeister |
      | I.am.batman.           |
    Then I am not registered
  	And I view the Registration form
    And I see an invalid username error message

@dev_ready
  Scenario: don't register if username already exists
    Given a username exists
    When I register with an existing username and a password
    Then I am not registered
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
