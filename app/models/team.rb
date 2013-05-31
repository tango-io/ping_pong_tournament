class Team < ActiveRecord::Base
  serialize  :picture

  validates_presence_of         :name

  has_and_belongs_to_many       :matches

  has_many                      :players

  accepts_nested_attributes_for :players

  def valid_team
    valid = []
    players.each do |player|
      valid << player.is_valid?
    end
    (valid.include? false) ? false : true
  end

end
