class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :type_account
      t.string :user_account
      t.string :picture_url
      t.integer :team_id

      t.timestamps
    end
  end
end
