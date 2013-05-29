class MatchRound < ActiveRecord::Base
  validates_presence_of :name

  validates :name, inclusion: %w(round\ of\ 16 quarters semifinal final)

  has_many :matches

  scope :round_of_16, -> { find_by(name: 'round of 16') }
  scope :semifinal,   -> { find_by(name: 'semifinal') }
  scope :quarters,    -> { find_by(name: 'quarters') }
  scope :final,       -> { find_by(name: 'final') }
end
