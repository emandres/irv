class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  
  validates :password, confirmation: true
  validates :email, email: true, presence: true, uniqueness: true
end
