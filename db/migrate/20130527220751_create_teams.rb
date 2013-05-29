class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string  :name
      t.string  :picture, default: "no picture"

      t.timestamps
    end
  end
end
