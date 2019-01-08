class User < ApplicationRecord
  validates :username, :uniqueness => true, :presence => true,length: {minimum: 4}
  validates :is_admin, :presence => true
  has_secure_password
  validates :password, length: {minimum: 6}
end
