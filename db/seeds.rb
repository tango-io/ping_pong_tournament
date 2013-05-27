# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for rounds in 1..4 
  number_of_records = case rounds
    when 1 then 16
    when 2 then 8
    when 3 then 4
    when 4 then 2
  end

  for n in 1..number_of_records
    Round.create(round: rounds, round_position: n)
  end
end
