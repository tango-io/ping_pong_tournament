class Match < ActiveRecord::Base
  validates_presence_of :match_number

  belongs_to :match_round

  has_and_belongs_to_many :teams

  has_many :match_sets

  def start
    if self.teams.count == 2
      3.times { |n| self.match_sets.create( set_number: n + 1 ) }
      self.match_sets.each do |set|
        set.scores.create(team: self.teams.first)
        set.scores.create(team: self.teams.last)
      end
    end
  end

  def match_winner
    team_1 = { team: teams.first, wins: 0 }
    team_2 = { team: teams.last,  wins: 0 }

    match_sets.each do | set |
      if team_1[:team] == set.winner
        team_1[:wins] += 1
      elsif team_2[:team] == set.winner
        team_2[:wins] += 1
      end
    end

    return team_1[:team] if team_1[:wins] == 2
    return team_2[:team]
  end
end
