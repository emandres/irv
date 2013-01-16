class CandidateRank < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :vote
  attr_accessible :rank, :candidate
  validates_presence_of :candidate
end
