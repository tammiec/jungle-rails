class User < ActiveRecord::Base

  has_secure_password

  validates :name, :email, :password, :password_confirmation, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  
end
