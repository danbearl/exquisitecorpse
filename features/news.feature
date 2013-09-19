Feature: News
  Scenario: An admin can create a news post
    Given the following user:
      | name     | Dan             |
      | email    | dan@example.com |
      | admin    | true            |
      | password | pass            |
    And that user is logged in
    And I am on the news page
    When I follow "New Post"
    And I fill in the following:
      | Title | A Post                     |
      | Body  | Some things about the site |
    And I press "Create Post"
    Then I should see "Post successfully created"
    And I should see "A Post"

  Scenario: An admin can delete a news post
    Given the following user:
      | name     | Dan             |
      | email    | dan@example.com |
      | admin    | true            |
      | password | pass            |
    And that user is logged in
    And the following post:
      | title | A Post                       |
      | body  | Something really interesting |
    And I am on the news page
    When I follow "Delete"
    Then I should see "Post successfully deleted."
    And I should not see "A Post"
