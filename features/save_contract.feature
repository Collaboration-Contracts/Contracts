@in_requirements
Feature:	In order to execute a collaboration contract over several sessions
          As a contract owner
          I want to save a contract

Scenario: require login in order to save
  Given I am not logged in
  When I am on the Contract page
  Then I see the disabled Save button
  And I see the Login and Register links on the Contract page
  And I see the Login and Register links in the nav menu

Scenario: save is enabled once I login and contract does not refresh
  Given I enter 'New Contract' for the contract title
  When I login with a registered username and password
  Then I see 'New Contract' for the contract title
  And I see the Save button
  And I do not see the Login and Register links on the Contract page
  And I do not see the Login and Register links in the nav menu

Scenario: save contract and display title in my dashboard
  Given I enter 'New Contract' for the contract title
  When I save the contract
  Then I see a saved contract confirmation message
  And I see 'New Contract' in my dashboard

Scenario: don't save contract if the title is blank
  Given I enter no contract title
  When I save the contract
  Then I see a blank contract title error message
  And I do not see a saved contract confirmation message
  And I do not see 'New Contract' in my dashboard
