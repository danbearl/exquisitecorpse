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

  Scenario: A user can edit his profile
    Given the following user:
      | email    | dan@example.com |
      | name     | Dan             |
      | password | pass            |
    And that user is logged in
    And I am on the home page
    When I follow "Profile"
    And I follow "Edit Profile"
    And I fill in the following:
      | About | Dan is a swell guy! |
    And I press "Update Profile"
    Then I should see "Dan's Profile"
    And I should see "Dan is a swell guy!"
