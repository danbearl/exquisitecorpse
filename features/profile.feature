Feature: Profile
  Scenario: A user can view his profile
    Given the following user:
      | email    | dan@example.com |
      | name     | Dan             |
      | password | pass            |
    And that user is logged in
    And I am on the home page
    When I follow "Profile"
    Then I should see "Dan's Profile"
    And I should see "About"
    And I should see "Contributions"
    And I should see "Friends"
