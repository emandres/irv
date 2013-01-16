class Candidate < ActiveRecord::Base
  belongs_to :ballot
  attr_accessible :name, :ballot_id
  validates_presence_of :name, :ballot
end
