class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :authorizations
  has_many :users, through: :authorizations

  def to_s
    name
  end
end
