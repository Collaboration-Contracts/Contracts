class User < ApplicationRecord
  validates_presence_of :username, :password_digest
  validates :username,
    length: {
      minimum: MIN_USERNAME_LENGTH,
      maximum: MAX_USERNAME_LENGTH
    }, uniqueness: true

  has_secure_password
end
