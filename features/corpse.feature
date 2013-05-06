Feature: Corpse

  Background:
    Given the following user:
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
    And that user is logged in

  Scenario: User starts a new corpse
    Given I am on the home page
    When I follow "New Corpse"
    And I fill in the following:
      | Body | There once was a man from nantucket. |
    And I press "Create Corpse"
    Then I should see "A new corpse has begun to grow."
