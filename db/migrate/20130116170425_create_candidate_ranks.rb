class CreateCandidateRanks < ActiveRecord::Migration
  def change
    create_table :candidate_ranks do |t|
      t.references :candidate
      t.references :vote
      t.integer :rank

      t.timestamps
    end
    add_index :candidate_ranks, :candidate_id
    add_index :candidate_ranks, :vote_id
  end
end
