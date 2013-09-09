class User < ActiveRecord::Base
  has_secure_password

  has_many :snippets
  has_one :profile

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :name

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
end
