Feature: Morgue
  Scenario: Full corpses appear in the morgue
    Given 1 corpse
    And that corpse is full
    And I am on the home page
    When I follow "Morgue"
    Then I should see "aaaaaaaaaaaaaa"
