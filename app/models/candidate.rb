class Candidate < ActiveRecord::Base
  belongs_to :ballot
  attr_accessible :name
end
