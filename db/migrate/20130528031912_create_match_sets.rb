class CreateMatchSets < ActiveRecord::Migration
  def change
    create_table :match_sets do |t|
      t.integer :match_id
      t.integer :team_id

      t.timestamps
    end
  end
end
