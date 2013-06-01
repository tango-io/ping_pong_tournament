object match
attributes :match_number
child :teams, :object_root => false do
  attributes :id, :name, :picture
end
child :sets, :object_root => false do
  attributes :id, :set_number
  child :scores, :object_root => false do
    attributes :id, :total, :team_id
  end
end
