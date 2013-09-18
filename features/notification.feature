Feature: Notifications
  Scenario: A user is notified when a corpse becomes complete
    Given 1 corpse
    And that corpse is almost full
    And the following user:
      | name     | Dan           |
      | email    | dan@gmail.com |
      | password | pass          |
    And that user is logged in
    And I am on the home page
    When I follow "Add To Corpse"
    And I enter the following:
      | Enter thy text: | abcdefghijklmnopqrstuvwxyz |
    And I press "Update Corpse"
    Then I should see "1 new notification"
