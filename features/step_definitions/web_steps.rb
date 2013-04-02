Given "I am on the home page" do
  visit root_path
end

Given "I am on the login page" do
  visit new_user_session_path
end

When /^I follow "(.*?)"$/ do |link|
  click_link link
end

When "I fill in the following:" do |table|
  table.raw.each do |row|
    fill_in row[0], with: row[1]
  end
end

When /^I press "(.*?)"$/ do |button|
  click_button button
end

Then /^I should see "(.*?)"$/ do |text|
  within "body" do
    page.should have_content(text)
  end
end
