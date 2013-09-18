Feature: Likes
  Scenario: A user can like a corpse
    Given the following user:
      | name     | Dan             |
      | email    | dan@example.com |
      | password | pass            |
    And that user is logged in
    And 1 corpse
    And that corpse has the following snippet:
      | body      | Here is some meaningful text. |
      | author_id | 1                             |
    And I am viewing that corpse
    When I follow "Like"
    Then I should see "Unlike"

  Scenario: A user can unlike a corpse
    Given the following user:
      | name     | Dan             |
      | email    | dan@example.com |
      | password | pass            |
    And that user is logged in
    And 1 corpse
    And that corpse has the following snippet:
      | body      | Here is some meaningful text. |
      | author_id | 1                             |
    And that user likes that corpse
    And I am viewing that corpse
    When I follow "Unlike"
    Then I should see "Like"
