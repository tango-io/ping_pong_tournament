class MatchRound < ActiveRecord::Base
  validates_presence_of :name, :number

  validates :name, inclusion: %w(round\ of\ 16 quarters semifinal final)

  has_many :matches

  scope :round_of_16, -> { find_by(name: 'round of 16') }
  scope :semifinal,   -> { find_by(name: 'semifinal') }
  scope :quarters,    -> { find_by(name: 'quarters') }
  scope :final,       -> { find_by(name: 'final') }

  def advance_from_round team, actual_match_position
    unless team.nil?
      next_round_matches = MatchRound.find_by(number: number + 1).matches
      new_match_position = (actual_match_position/2 + actual_match_position%2 )
      next_match = next_round_matches.find_by(match_number: new_match_position)
      next_match.teams << team if next_match.teams.count < 2
    end
  end

  def available_matches
    matches.reject{ |m| m.teams.size >= 2 }
  end

end
