class User < ActiveRecord::Base
  has_secure_password
  validates :password_digest, confirmation: true
end
