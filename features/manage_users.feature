Feature: Manage users
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new user
    Given I am on the new user page
    When I fill in "Email" with "email 1"
    And I fill in "Name" with "name 1"
    And I fill in "Age" with "1"
    And I press "Create"
    Then I should see "email 1"
    And I should see "name 1"
    And I should see "1"

  Scenario: Delete user
    Given the following users:
      |email|name|age|
      |email 1|name 1|1|
      |email 2|name 2|2|
      |email 3|name 3|3|
      |email 4|name 4|4|
    When I delete the 3rd user
    Then I should see the following users:
      |Email|Name|Age|
      |email 1|name 1|1|
      |email 2|name 2|2|
      |email 4|name 4|4|
