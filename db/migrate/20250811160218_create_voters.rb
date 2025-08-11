class CreateVoters < ActiveRecord::Migration[7.0]
  def change
    create_table :voters do |t|
      t.string :email
      t.datetime :voted_at

      t.timestamps
    end
    add_index :voters, :email, unique: true
  end
end
