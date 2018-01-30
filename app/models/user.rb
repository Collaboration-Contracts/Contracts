class User < ApplicationRecord

  validates_presence_of :username
  validates_length_of   :username,
                        :in => MIN_USERNAME_LENGTH..MAX_USERNAME_LENGTH
  validates             :username, :uniqueness => true
  validates_format_of   :username, :with => VALID_USERNAME_CHARS

  validates_presence_of :password_digest

  validates_length_of   :password, minimum: 6, message: INVALID_PASSWORD
  has_secure_password

  def custom_error_messages
    messages = []

    if username.length == 0
      messages << BLANK_REGISTER_PARAMS
    elsif !username.length.between?(MIN_USERNAME_LENGTH,MAX_USERNAME_LENGTH) || !username.match(VALID_USERNAME_CHARS)
      messages << INVALID_USERNAME
    end

    if password.nil?
      messages << BLANK_REGISTER_PARAMS
    else
      messages << errors.messages[:password]
    end

    User.find_by(username: username) ? messages << EXISTING_USERNAME : nil

    messages.flatten.uniq
  end
end
