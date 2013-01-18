class Ballot < ActiveRecord::Base
  attr_accessible :name
  has_many :votes
  has_many :candidates 

  def to_s
    name
  end
end
