class User < ApplicationRecord 
  after_initialize :ensure_session_token 
  validates :email, :password_digest, :session_token, presence: true 
  validates :password, length: { minimum: 6, allow_nil: true } #memorize this 
  attr_reader :password 
  def self.user_find_by_credentials(email, password) #sets user to a instance of user with the same email as the one passed in through the arguement. Afterthat it checks to see if the password matches by calling the method we created previously (is_password?)
    # debugger
    user = User.find_by(email: email)
    # debugger 
    return nil unless user && user.is_password?(password)
    # debugger
    user 
  end 

  def self.generate_session_token  #generates a session token using secure random. 
    SecureRandom::urlsafe_base64 
  end 

  def reset_session_token 
    self.session_token = self.class.generate_session_token
    self.save! 
    self.session_token 
  end 

  def ensure_session_token 
    self.session_token ||= self.class.generate_session_token 
  end 

  def password=(password) 
    @password = password
    self.password_digest = BCrypt::Password.create(password) #sets a new password equal to the bcrypt digest made from passing in your password from arg 
  end 

  def is_password?(password) 
    new_digest = BCrypt::Password.new(self.password_digest) #recall bcrypt salts 
    new_digest.is_password?(password)  #make sure you follow this protocol. If you try to create a bcrypt password using .create it would not work due to salting. 

  end 

  







end 