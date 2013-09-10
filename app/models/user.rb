class User < ActiveRecord::Base
  has_secure_password

  has_many :snippets, foreign_key: 'author_id'
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
end
