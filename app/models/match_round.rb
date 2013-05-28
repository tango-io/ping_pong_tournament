class MatchRound < ActiveRecord::Base
  validates_presence_of :name

  validates :name, inclusion: %w(round\ of\ 16 quarters semifinal final)

  has_many :matches

  scope :round_of_16, -> { where(name: 'round of 16').shift }
  scope :semifinal,   -> { where(name: 'semifinal').shift }
  scope :quarters,    -> { where(name: 'quarters').shift }
  scope :final,       -> { where(name: 'final').shift }
end
