class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :total,   :default => 0
      t.integer :match_set_id
      t.integer :team_id

      t.timestamps
    end
  end
end
