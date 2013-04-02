class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
end
