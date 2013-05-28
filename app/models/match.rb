class Match < ActiveRecord::Base
  validates_presence_of :match_number

  belongs_to :match_round

  has_many :match_sets
end
