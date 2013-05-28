class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :match_number
      t.integer :match_round_id

      t.timestamps
    end
  end
end
