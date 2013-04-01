Feature: Login
  Background: User exists
    Given the following user:
      | email                 | dan@example.com |
      | password              | pass            |
      | passowrd_confirmation | pass            |


  Scenario: User logs in
    Given I am on the login page
    When I fill in the following:
      | Email    | dan@example.com |
      | Password | pass            |
    And I press "Log In"
    Then I should see "Successfully logged in!"
