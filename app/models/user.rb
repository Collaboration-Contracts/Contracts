class User < ApplicationRecord

  validates_presence_of :username
  validates_length_of   :username,
                        :in => MIN_USERNAME_LENGTH..MAX_USERNAME_LENGTH
  validates             :username, :uniqueness => true
  validates_format_of   :username, :with => VALID_USERNAME_CHARS

  validates_presence_of :password_digest

  validates_length_of   :password, {minimum: 6}
  has_secure_password

  def custom_error_messages
    messages = []
    if username.length == 0 || password.nil?
      messages << BLANK_REGISTER_PARAMS
    elsif !username.length.between?(MIN_USERNAME_LENGTH,MAX_USERNAME_LENGTH) || !username.match(VALID_USERNAME_CHARS)
      messages << INVALID_USERNAME
    end

    ## only way I can think to access the password length before it gets encrypted
    ## use active model validation from above to access the Object's errors
    !errors.messages[:password].empty? ? messages << INVALID_PASSWORD : nil
    
    User.find_by(username: username) ? messages << EXISTING_USERNAME : nil

    !messages.empty? ? messages : nil
  end

  private

  def validate_password
    if password.length < MIN_PASSWORD_LENGTH
      ## do something here
    end
  end
end
