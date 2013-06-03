class MatchSet < ActiveRecord::Base
  validates_presence_of :match, :set_number, :position

  has_many :scores, dependent: :delete_all

  belongs_to :match
  belongs_to :winner, foreign_key: 'team_id', class_name: 'Team'

  default_scope order('position ASC')

  def set_winner
    self.winner = scores.order('total DESC').first.team
    save
  end
end
