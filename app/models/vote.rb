class Vote < ActiveRecord::Base
  belongs_to :ballot
  has_many :candidate_ranks
  # attr_accessible :title, :body
end
