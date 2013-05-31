collection matches
attributes :id, :match_number
child :teams, :object_root => false do
  attributes :id, :name, :picture 
end
