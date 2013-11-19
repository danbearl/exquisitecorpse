Feature: User
  Scenario: A user creates an account
    Given I am on the home page
    When I follow "Sign Up"
    And I fill in the following:
      | Email                      | dan@example.com |
      | Name                       | Dan             |
      | user_password              | pass            |
      | user_password_confirmation | pass            |
    And I press "Join!"
    Then I should see "You're signed up!"

  Scenario: A user changes his email
    Given the following user:
      | email                 | dan@example.com |
      | name                  | Dan             |
      | password              | pass            |
      | password_confirmation | pass            |
    And that user is logged in
    And I am viewing that user's profile
    When I follow "Edit Information"
    And I fill in the following:
      | Name     | Daniel                |
      | Email    | dan.bearl@example.com |
      | Password | pass                  |
    And I press "Save Changes"
    Then I should see "Daniel"
    And I should see "Account information updated."
      
  Scenario: A user changes her password
    Given the following user:
      | email                 | dan@example.com |
      | name                  | Dan             |
      | password              | pass            |
      | password_confirmation | pass            |
    And that user is logged in
    And I am viewing that user's profile
    When I follow "Change Password"
    And I fill in the following:
      | Old Password              | pass    |
      | New Password              | newpass |
      | New Password Confirmation | newpass |
    And I press "Save Password"
    And I follow "Log Out"
    And I follow "Log In"
    And I fill in the following:
      | Email    | dan@example.com |
      | Password | newpass         |
    And I press "Log In"
    Then I should see "Successfully logged in!"
