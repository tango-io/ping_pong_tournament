class CreateMatchRounds < ActiveRecord::Migration
  def change
    create_table :match_rounds do |t|
      t.string  :name
      t.integer :number

      t.timestamps
    end
  end
end
