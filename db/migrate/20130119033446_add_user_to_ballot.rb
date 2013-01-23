class AddUserToBallot < ActiveRecord::Migration
  def change
    add_column :ballots, :user_id, :integer
    add_index :ballots, :user_id
  end
end
