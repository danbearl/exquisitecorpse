class User < ActiveRecord::Base
  has_secure_password

  has_many :likes
  has_many :snippets, foreign_key: 'author_id'
  has_many :notifications
  has_one :profile
  has_and_belongs_to_many :friends, 
    class_name: 'User', 
    foreign_key: "friend_id", 
    join_table: "friends_users"

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :name

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end

  def add_friend(friend)
    self.friends << friend
    save!
  end

  def remove_friend(friend)
    self.friends.delete(friend)
    save!
  end

  def list_friends
    friends = []
    self.friends.each do |f|
      friends << f.name
    end

    return friends.join(", ")
  end
end
