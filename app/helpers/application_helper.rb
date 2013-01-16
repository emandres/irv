module ApplicationHelper
  def ballot_options_for_select
    options_for_select Ballot.all.map { |b| [ b.name, b.id ] }
  end
end
