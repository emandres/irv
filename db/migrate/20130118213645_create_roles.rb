class CreateRoles < ActiveRecord::Migration
  def up
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    [ 'user_admin', 'ballot_admin', 'voter' ].each do |r|
      Role.new(name: r).save
    end
  end

  def down
    drop_table :roles
  end
end
