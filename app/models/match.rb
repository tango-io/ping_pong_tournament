class Match < ActiveRecord::Base
  validates_presence_of :match_number

  belongs_to :match_round

  has_many :match_sets
  has_many :team_matches

  def start
    if self.team_matches.count == 2
      3.times { self.match_sets.create }
    end
  end
end
