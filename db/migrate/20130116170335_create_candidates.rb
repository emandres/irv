class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.references :ballot

      t.timestamps
    end
    add_index :candidates, :ballot_id
  end
end
