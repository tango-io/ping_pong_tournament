class Round < ActiveRecord::Base
  validates_presence_of :name

  validates :name, inclusion: %w(round\ of\ 16 quarters semifinal final)

  scope :round_of_16, -> { where(name: 'round of 16') }
  scope :semifinal,   -> { where(name: 'semifinal') }
  scope :quarters,    -> { where(name: 'quarters') }
  scope :final,       -> { where(name: 'final') }
end
