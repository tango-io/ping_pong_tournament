class Team < ActiveRecord::Base

  validates_presence_of         :name

  has_and_belongs_to_many       :matches

  has_many                      :players

  accepts_nested_attributes_for :players

  has_many                      :scores
  has_many                      :sets, class_name: 'MatchSet'

  mount_uploader :picture, PictureUploader

  def valid_team?
    valid = []
    valid << false if self.name == ""
    players.each do |player|
      valid << player.is_valid?
    end
    (valid.include? false) ? false : true
  end
end
