class MatchRound < ActiveRecord::Base
  validates_presence_of :name, :number

  validates :name, inclusion: %w(round\ of\ 16 quarters semifinal final)

  has_many :matches

  scope :round_of_16, -> { find_by(name: 'round of 16') }
  scope :semifinal,   -> { find_by(name: 'semifinal') }
  scope :quarters,    -> { find_by(name: 'quarters') }
  scope :final,       -> { find_by(name: 'final') }

  def next_round
    return MatchRound.find_by(number: number + 1)
  end

  def advance_from_round team, next_match
    unless next_match.teams.count < 2 and next_match.teams.include?(team) or team.nil?
      next_match.teams << team if next_match.teams.count < 2
    end

    if next_match.teams.count == 2 and next_match.sets.empty?
      next_match.start
    end
  end

  def available_matches
    matches.reject{ |m| m.teams.size >= 2 }
  end

end
