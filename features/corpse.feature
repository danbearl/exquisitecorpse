Feature: Corpse

  Scenario: View a corpse
    Given 1 corpse
    And that corpse has the following snippet:
      | body      | This is some corpse text. |
      | author_id | 1                         |
    And I am viewing that corpse
    Then I should see "This is some corpse text."

  Scenario: User starts a new corpse
    Given the following user:
      | email    | dan@example.com |
      | password | pass            |
      | name     | Dan             |
    And that user is logged in
    When I follow "New Corpse"
    And I fill in the following:
      | Enter thy text: | There once was a man from nantucket. |
    And I press "Create Corpse"
    Then I should see "A new corpse has begun to grow."

  Scenario: User adds to an existing corpse
    Given 1 corpse
    And that corpse has the following snippet:
      | body      | This is some corpse text. |
      | author_id | 1                         |
    And the following user:
      | email    | dan@example.com |
      | password | pass            |
      | name     | Dan             |
    And that user is logged in
    And I am on the home page
    When I follow "Add To Corpse"
    And I fill in the following:
      | Enter thy text: | Here is some more corpse text. |
    And I press "Update Corpse"
    Then I should see "The corpse has grown."

  Scenario: Corpse closes itself once body length >= 3,000
    Given 1 corpse
    And that corpse is almost full
    And the following user:
      | email    | dan@example.com |
      | password | pass            |
      | name     | Dan             |
    And that user is logged in
    And I am on the home page
    When I follow "Add To Corpse"
    And I fill in the following:
      | Enter thy text: | This should close it out! |
    And I press "Update Corpse"
    Then I should see "The corpse is now complete."
    And I should see "This should close it out!"
