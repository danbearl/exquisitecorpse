Feature: Comments
  Scenario: An authenticated user can comment on a corpse
    Given the following user:
      | name     | dan             |
      | email    | dan@example.com |
      | password | pass            |
    And that user is logged in
    And 1 corpse
    And I am viewing that corpse
    When I fill in the following: 
      | Comment | This is a great corpse! |
    And I press "Add Comment"
    Then I should see "Comment added."
    And I should see "This is a great corpse!"
