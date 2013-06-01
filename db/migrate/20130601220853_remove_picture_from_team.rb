class RemovePictureFromTeam < ActiveRecord::Migration
  def change
    remove_column :teams, :picture
    add_column :teams, :picture, :string
  end
end
