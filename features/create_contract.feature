@dev_ready
Feature:	In order to execute a collaboration contract
          As a contract owner
          I want to create a contract


  Scenario: create contract with title
    Given I enter 'New Contract' for the contract title
    When I save the contract
    Then I have a contract with the title 'New Contract'


  Scenario: no contract with blank title
    Given I enter '' for the contract title
    When I save the contract
    Then I do not have a contract
    And I view a title required error message


  Scenario Outline: create contract with valid title
    Given I enter '<valid_title>' for the contract title
    When I save the contract
    Then I have a contract with the title '<valid_title>'

      Examples:
        | valid_title                 |
        | Can haz punctuation's ! #   |
        | Subject 2, Contract 1       |
        | HR / Holidays / Federal     |
        | HR \ Holidays -> Federal    |
        | ') or 1=1-- SQL Injection?  |


  Scenario Outline: don't create contract with invalid title
    Given I enter '<invalid_title>' for the contract title
    When I save the contract
    Then I do not have a contract
    And I view an invalid contract title error message

      Examples:
        | invalid_title          |
        | dog                    |
        | This is longer than 80 characters and it's therefore not a valid title for a contract, despite meeting all other criteria. |
        | No glyphs  |
