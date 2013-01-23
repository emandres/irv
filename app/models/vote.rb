class Vote < ActiveRecord::Base
  belongs_to :ballot
  belongs_to :user
  has_many :candidate_ranks
  accepts_nested_attributes_for :candidate_ranks
  attr_accessible :ballot_id, :rank, :candidate_ranks_attributes, :candidate_ranks, :ballot

  validates :ballot, presence: true
  validate :candidate_ranks_uniq
  validate :candidate_rank_for_each_candidate

  def candidate_ranks_uniq
    non_nil_candidate_ranks = candidate_ranks.map(&:rank).reject { |r| r.nil? }
    if non_nil_candidate_ranks.count != non_nil_candidate_ranks.uniq.count
      errors.add(:candidate_ranks, 'must have unique ranks')
    end
  end

  def candidate_rank_for_each_candidate
    if ballot && ballot.candidates.count != candidate_ranks.to_a.count
      errors.add(:candidate_ranks, 'must have a candidate rank for each candidate on the ballot')
    end
  end
end
