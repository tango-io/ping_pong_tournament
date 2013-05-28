class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :total
      t.integer :match_set_id

      t.timestamps
    end
  end
end
