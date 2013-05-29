class Match < ActiveRecord::Base
  validates_presence_of :match_number

  belongs_to :round,  foreign_key: 'match_round_id',  class_name: 'MatchRound'
  has_many    :sets,  class_name: 'MatchSet'

  has_and_belongs_to_many :teams

  def start
    if self.teams.count == 2
      3.times { |n| self.sets.create( set_number: n + 1 ) }
      self.sets.each do |set|
        set.scores.create(team: self.teams.first)
        set.scores.create(team: self.teams.last)
      end
    end
  end

  def match_winner
    team_1 = { team: teams.first, wins: 0 }
    team_2 = { team: teams.last,  wins: 0 }

    sets.each do | set |
      if team_1[:team] == set.winner
        team_1[:wins] += 1
      elsif team_2[:team] == set.winner
        team_2[:wins] += 1
      end
    end

    winner = nil 
    winner = team_1[:team] if team_1[:wins] == 2
    winner = team_2[:team] if team_2[:wins] == 2

    round.advance_from_round winner, match_number

    return winner
  end
end
