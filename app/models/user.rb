class User < ActiveRecord::Base
  has_many :authorizations, dependent: :destroy
  has_many :roles, through: :authorizations
  attr_accessible :email, :password, :password_confirmation
  
  has_secure_password
  
  validates :password, confirmation: true
  validates :email, email: true, presence: true, uniqueness: true

  def unauthorized_roles
    @unauthorized_roles ||= Role.all.reject { |r| roles.include? r }
  end

  def to_s
    email
  end
end
