class Team < ActiveRecord::Base

  validates_presence_of         :name
  serialize  :picture, Hash

  has_many                      :players
  accepts_nested_attributes_for :players

end
