class User < ApplicationRecord
  validates_presence_of :username, :password_digest
  validates_length_of   :username, in: 6..20, :message => INVALID_USERNAME
  validates             :username, uniqueness: true
  validates_format_of   :username, :with => /\A[A-Za-z0-9]*\z/, :message => INVALID_USERNAME

  has_secure_password


  def full_error_messages
    errors.messages.values[0].uniq
  end
end
