class IrvElection
  def initialize(ballot)
    @ballot = ballot
    @candidates = ballot.candidates
    @votes = ballot.votes
    @eliminated_candidates = []
  end
  
  def winner
    if @candidates.empty?
      return nil
    end
    winning_number = @votes.count / 2
    number_rounds = 0
    while true
      number_rounds += 1
      vote_counts = count_votes
      best_candidate = vote_counts.sort_by { |k, v| v }.last[0]
      if vote_counts[best_candidate] >= winning_number
        return best_candidate
      else
        worst_candidate = vote_counts.sort_by { |k, v| v }.first[0]
        worst_number_votes = vote_counts[worst_candidate]
        @eliminated_candidates.concat vote_counts.find_all { |k, v| v == worst_number_votes }[0]
        if @candidates.reject { |c| @eliminated_candidates.include? c }.empty?
          return nil
        end
      end
    end
  end

  private
  def count_votes
    valid_candidates = @candidates.find_all { |c| !@eliminated_candidates.include? c }
    vote_counts = Hash[valid_candidates.collect { |c| [c, 0] }]
    @votes.each do |v|
      preferred_candidate = preferred_candidate(v, @eliminated_candidates)
      vote_counts[preferred_candidate] += 1 if preferred_candidate
    end
    return vote_counts
  end

  def preferred_candidate(vote, eliminated_candidates)
    vote.candidate_ranks.find_all{ |cr| cr.rank != nil }.
      reject { |cr| eliminated_candidates.include? cr.candidate }.
      sort_by(&:rank).
      map(&:candidate).
      first
  end
end
