class User < ActiveRecord::Base

  has_secure_password

  validates :name, :email, :password, :password_confirmation, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, length: { minimum: 6 }
  
end
