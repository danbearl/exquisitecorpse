require 'spec_helper'

describe User do

  describe "#add_friend" do
    it 'adds a friend association to the user model' do
      user = User.create(email: "dan@example.com", 
                          name: "Dan", 
                          password: "pass",
                          password_confirmation: "pass")
      friend1 = User.create(email: "laura@example.com",
                            name: "Laura",
                            password: "pass",
                            password_confirmation: "pass")

      user.add_friend(friend1)

      User.find(user.id).friends.first.should eq(friend1)
    end
  end

  describe "#remove_friend" do
    it 'removes a friend association from the user model' do
      user = User.create(email: "dan@example.com", 
                          name: "Dan", 
                          password: "pass",
                          password_confirmation: "pass")
      friend1 = User.create(email: "laura@example.com",
                            name: "Laura",
                            password: "pass",
                            password_confirmation: "pass")
      user.add_friend(friend1)
      user.remove_friend(friend1)

      User.find(user.id).friends.first.should eq(nil)
    end
  end

  describe "#list_friends" do
    it 'returns a comma separated list of the associated friends' do
      user1 = User.create(email: "dan@example.com", 
                          name: "Dan", 
                          password: "pass",
                          password_confirmation: "pass")
      friend1 = User.create(email: "laura@example.com",
                            name: "Laura",
                            password: "pass",
                            password_confirmation: "pass")
      friend2 = User.create(email: "ben@example.com",
                            name: "Ben",
                            password: "pass",
                            password_confirmation: "pass")
      friend3 = User.create(email: "micah@example.com",
                            name: "Micah",
                            password: "pass",
                            password_confirmation: "pass")
      user1.friends << friend1
      user1.friends << friend2
      user1.friends << friend3
      
      user1.list_friends.should eq("Laura, Ben, Micah")
    end
  end
end
