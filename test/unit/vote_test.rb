require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test 'null rank okay' do
    #debugger
    v = generate_vote(:one) { |i| nil }
    assert_valid(v)
  end

  test 'same rank fails' do
    #debugger
    v = generate_vote(:one) { |i| 1 }
    assert_invalid(v)
  end

  test 'sequential ranks okay' do
    v = generate_vote(:one) { |i| i }
    assert_valid(v)
  end

  test 'sequential ranks in large ballot okay' do
    v = generate_vote(:two) { |i| i }
    assert_valid(v)
  end

  test 'duplicate ranks in large ballot fails' do
    v = generate_vote(:two) { |i| i % 2 }
    assert_invalid(v)
  end

  test 'some nil in large ballot okay' do
    v = generate_vote(:two) { |i| i > 5 ? nil : i }
    assert_valid(v)
  end

  def generate_vote(ballot_sym)
    b = ballots(ballot_sym)
    cr = b.candidates.each_with_index.
      map { |c, i| CandidateRank.new(candidate: c, rank: yield(i)) }
    Vote.new(ballot: b, candidate_ranks: cr)
  end

  test 'no ballot fails' do
    v = Vote.new
    assert_invalid(v)
  end

  test 'missing candidate rank fails' do
    v = generate_vote(:one) { |i| i }
    v.candidate_ranks.delete v.candidate_ranks.last
    assert_invalid(v)
  end

  def assert_valid(v)
    if !v.valid?
      assert false, error_string(v.errors)
    end
  end

  def assert_invalid(v)
    if v.valid?
      assert false, error_string(v.errors)
    end
  end

  def error_string(errors)
    errors.map { |k,val| "#{k.to_s} #{val}" }.join(';')
  end
end
