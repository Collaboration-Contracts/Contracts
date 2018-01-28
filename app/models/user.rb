class User < ApplicationRecord
  validates_presence_of :username, :password_digest
  validates_length_of   :username,
                        :in => MIN_USERNAME_LENGTH..MAX_USERNAME_LENGTH
  validates             :username, :uniqueness => true
  validates_format_of   :username, :with => VALID_USERNAME_CHARS

  has_secure_password

  def custom_error_messages
    if !username.length.between?(MIN_USERNAME_LENGTH,MAX_USERNAME_LENGTH) || !username.match(VALID_USERNAME_CHARS)
      return [INVALID_USERNAME]
    end
  end
end
