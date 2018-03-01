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

    messages << check_blank_username(username)
    messages << check_username_format(username)
    messages << BLANK_REGISTER_PARAMS if password.nil?
    messages << (errors.messages[:password] -= ["can't be blank"])

    User.find_by(username: username) ? messages << EXISTING_USERNAME : nil

    messages.reject(&:blank?).flatten.uniq
  end

  def check_blank_username(username)
    BLANK_REGISTER_PARAMS if username.length == 0
  end

  def check_username_format(username)
    INVALID_USERNAME unless username.length.between?(MIN_USERNAME_LENGTH,MAX_USERNAME_LENGTH) && username.match(VALID_USERNAME_CHARS)
  end

end
