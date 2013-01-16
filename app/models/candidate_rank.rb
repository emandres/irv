class CandidateRank < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :vote
  attr_accessible :rank
end
