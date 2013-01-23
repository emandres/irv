class Ballot < ActiveRecord::Base
  attr_accessible :name
  has_many :votes
  has_many :candidates 
  belongs_to :user

  def to_s
    name
  end
end
