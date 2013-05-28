# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MatchRound.create(name: 'round of 16')
MatchRound.create(name: 'quarters')
MatchRound.create(name: 'semifinal')
MatchRound.create(name: 'final')

@matches = 8 
MatchRound.all.each do | round |
  for n in 1..@matches
    round.matches.create( match_number: n )
  end

  @matches = @matches / 2
end
