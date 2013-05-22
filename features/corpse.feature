Feature: Corpse

  Background:
    Given the following user:
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
    And that user is logged in

  Scenario: View a corpse
    Given 1 corpse
    And that corpse has the following snippet:
      | body      | This is some corpse text. |
      | author_id | 1                         |
    And I am viewing that corpse
    Then I should see "This is some corpse text."

  Scenario: User starts a new corpse
    Given I am on the home page
    When I follow "New Corpse"
    And I fill in the following:
      | Body | There once was a man from nantucket. |
    And I press "Create Corpse"
    Then I should see "A new corpse has begun to grow."
