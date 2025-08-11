class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.string :candidate
      t.integer :vote_count

      t.timestamps
    end
    add_index :votes, :candidate, unique: true
  end
end
