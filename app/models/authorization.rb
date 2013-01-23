class Authorization < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  validates :user_id, uniqueness: { scope: :role_id }

  attr_accessible :user_id, :role_id
end
