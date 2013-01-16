class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :ballot

      t.timestamps
    end
    add_index :votes, :ballot_id
  end
end
