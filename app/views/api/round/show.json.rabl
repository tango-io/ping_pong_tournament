collection matches
attributes :id, :match_number
child :teams, :object_root => false do
  attributes :id, :name, :picture 
end
node  :champion do |match|
  match.have_winner
end if matches.count == 1
