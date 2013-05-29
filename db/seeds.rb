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
