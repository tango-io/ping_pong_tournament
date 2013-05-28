class CreateTeamMatches < ActiveRecord::Migration
  def change
    create_table :team_matches do |t|
      t.integer :team_id
      t.integer :match_id

      t.timestamps
    end
  end
end
