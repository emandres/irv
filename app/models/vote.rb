class Vote < ActiveRecord::Base
  belongs_to :ballot
  has_many :candidate_ranks
  accepts_nested_attributes_for :candidate_ranks
  attr_accessible :ballot_id, :rank, :candidate_ranks_attributes
end
