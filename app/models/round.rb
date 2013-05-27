class Round < ActiveRecord::Base
  validates_presence_of :round, :round_position

  scope :first,  -> { where(round: 1) }
  scope :second, -> { where(round: 2) }
  scope :third,  -> { where(round: 3) }
  scope :fourth, -> { where(round: 4) }
end
