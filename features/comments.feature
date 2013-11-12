Feature: Comments
  Scenario: An authenticated user can comment on a corpse
    Given the following user:
      | name                  | dan             |
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
    And that user is logged in
    And 1 corpse
    And that corpse has 1 snippet
    And I am viewing that corpse
    When I fill in the following: 
      | comment_body | This is a great corpse! |
    And I press "Comment"
    Then I should see "Your comment has been recorded"
    And I should see "This is a great corpse!"
