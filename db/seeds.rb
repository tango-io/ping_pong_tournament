# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MatchRound.create(name: 'round of 16', number: 1)
MatchRound.create(name: 'quarters', number: 2)
MatchRound.create(name: 'semifinal', number: 3)
MatchRound.create(name: 'final', number: 4)

@matches = 8 
MatchRound.all.each do | round |
  for n in 1..@matches
    round.matches.create( match_number: n )
  end

  @matches = @matches / 2
end
picture_url = { small: "team_picture_small.png", normal: "team_picture_normal.png", big: "team_picture_big.png"} 

16.times do | n |
  Team.create(name: 'dummy_' + n.to_s, picture: picture_url )
end

Team.all.each do | team |
  2.times do | n | 
    team.players.create(
      name: "player_" + n.to_s,
      type_account: 'twitter',
      user_account: 'user_' + n.to_s,
      email: 'user@mail.com',
      picture_url: picture_url
    )
  end
end

teams = Team.all
MatchRound.round_of_16.matches.all.each do | match |
  team_1 = teams.sample
  team_2 = teams.sample

  teams.delete_if { |team| team == team_1 or team == team_2 }

  match.teams << team_1
  match.teams << team_2
  
  match.start
end
