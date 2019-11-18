class User < ActiveRecord::Base

  attr_accessor :authenticate_with_credentials

  has_secure_password

  validates :name, :email, :password, :password_confirmation, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)

    if user && password
      user_by_email = user.authenticate(password)
    end
    
    if user && user_by_email
      return user_by_email
    else
      return nil
    end
  end
  
  
end
