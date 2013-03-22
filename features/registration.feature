Feature: Registration
	Scenario: User registers
		Given I am on the home page
		When I follow "Sign Up"
		And I fill in the following:
			| Email                      | user@example.com |
			| user_password              | pass             |
			| user_password_confirmation | pass             |
		And I press "Join!"
		Then I should see "You're signed up!"
