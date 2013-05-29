class MatchSet < ActiveRecord::Base
  validates_presence_of :match, :set_number

  has_many :scores

  belongs_to :match
  belongs_to :winner, foreign_key: 'team_id', class_name: 'Team'

  def set_winner
    self.winner = scores.order('total DESC').first.team
    save
  end
end
