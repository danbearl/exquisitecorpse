Given "I am on the home page" do
  visit '/'
end

Given "I am viewing that corpse" do
  visit corpse_path(@corpse)
end

Given "I am on the login page" do
  visit new_user_session_path
end

Given "that user is logged in" do
  visit "/log_in"

  fill_in 'Email', with: 'dan@example.com'
  fill_in 'Password', with: 'pass'

  click_button 'Log In'
end

Given "that corpse is almost full" do
  a = ""
  299.times do
    a << 'a'
  end

  10.times do
    @corpse.snippets.build(body: a)
  end

  @corpse.save!
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

Then /^I should not see "(.*?)"$/ do |text|
  within "body" do
    page.should_not have_content(text)
  end
end
