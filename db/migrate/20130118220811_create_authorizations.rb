class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.references :user
      t.references :role

      t.timestamps
    end
    add_index :authorizations, :user_id
    add_index :authorizations, :role_id
  end
end
