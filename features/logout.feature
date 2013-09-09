Feature: Log Out
  Scenario: A user logs out
    Given the following user:
      | name     | Dan             |
      | email    | dan@example.com |
      | password | pass            |
    And that user is logged in
    And I am on the home page
    When I follow "Log Out"
    Then I should see "Logged out!"
    And I should see "Log In"
    And I should see "Sign Up"
    And I should not see "Log Out"
