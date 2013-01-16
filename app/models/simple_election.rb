class SimpleElection
  def self.winners(ballot)
    first_choice_votes = ballot.votes.
      collect(&:candidate_ranks).
      flatten.
      filter { |cr| cr.rank == 1 }

    votes_per_candidate = first_choice_votes.
      group_by(&:candidate).
      map { |k, v| [ k, v.count ] }

    max_votes = votes_per_candidate.max { |a| a[1] }

    votes_per_candidates.
      find_all { |a| a[1] == max_votes }.
      map { |a| a[0] }
  end
end
