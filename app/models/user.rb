class User < ApplicationRecord
  validates_presence_of :username, :password_digest
  validates :username,
    length: {
      minimum: MIN_USERNAME_LENGTH,
      maximum: MAX_USERNAME_LENGTH
    }, uniqueness: true
    validates_format_of :username, :with => /\A[A-Za-z0-9]*\z/
  has_secure_password
end
