class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :round
      t.integer :round_position

      t.timestamps
    end
  end
end
