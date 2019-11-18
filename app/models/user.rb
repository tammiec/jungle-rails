class User < ActiveRecord::Base

  has_secure_password

  validates :name, :email, :password, :password_confirmation, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, length: { minimum: 6 }

  def authenticate_with_credentials(email, password)
    email_auth = self.authenticate(email)
    pass_auth = self.authenticate(password)
    if email_auth && pass_auth
      return self
    else
      return nil
    end
  end
  
  
end
