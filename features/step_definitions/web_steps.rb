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
    @corpse.snippets.build(body: a, author_id: 1)
  end

  @corpse.save!
end

Given "that corpse is full" do
  a = ""
  299.times do
    a << 'a'
  end

  11.times do
    @corpse.snippets.build(body: a, author_id: 1)
  end

  @corpse.save!
end

Given "that user has a friend" do
  @user.friends << Fabricate(:friend, name: 'Laura', email: 'laura@example.com', password: 'pass', password_confirmation: 'pass' )
end

Given "I am viewing that user's profile" do
  visit profile_path(@user.profile.id)
end

Given "that user likes that corpse" do
  Fabricate(:like, user_id: @user.id, corpse_id: @corpse.id )
end

Given "I am on the news page" do
  visit posts_path
end

When /^I follow "(.*?)"$/ do |link|
  click_link link
end

When /^I visit "(.*?)"$/ do |url|
  visit url
end

When "I visit that friend's profile" do 
  visit profile_path(@user.friends.first.profile.id)
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
