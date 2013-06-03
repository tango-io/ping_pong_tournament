class Match < ActiveRecord::Base
  validates_presence_of :match_number

  belongs_to :round,  foreign_key: 'match_round_id',  class_name: 'MatchRound'
  has_many    :sets,  class_name: 'MatchSet', dependent: :delete_all

  has_and_belongs_to_many :teams

  def start
    if teams.count == 2
      3.times { |n| sets.create( set_number: n + 1 ) }
      sets.each do |set|
        set.scores.create(team: teams.first)
        set.scores.create(team: teams.last)
      end
    end
  end

  def cancel_match
    sets.delete_all
  end

  def match_winner
    winner = have_winner

    round.advance_from_round winner, match_number
    return winner
  end

  def have_winner
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

    return winner
  end
end
