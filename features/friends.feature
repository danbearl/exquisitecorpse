Feature: Friends
  Scenario: A user adds a friend
    Given the following user:
      | email    | dan@example.com |
      | name     | Dan             |
      | password | pass            |
    And that user is logged in
    And the following user:
      | email    | laura@example.com |
      | name     | Laura             |
      | password | pass              |
    And I am viewing that user's profile
    When I follow "Add Friend"
    Then I should see "Friend Added"
      
  Scenario: A user removes a friend
    Given the following user:
      | email    | dan@example.com |
      | name     | Dan             |
      | password | pass            |
    And that user is logged in
    And that user has a friend
    When I visit that friend's profile
    And I follow "Remove Friend"
    Then I should see "Friend Removed"
    And I should not see "Remove Friend"
    And I should see "Add Friend"
