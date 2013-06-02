collection matches
attributes :id, :match_number
child :teams, :object_root => false do
  attributes :id, :name
  node :picture_url, :object_root => false do | team |
    team.picture.url
  end
end
child :sets, :object_root => false do
  attributes :id, :set_number
  child :scores, :object_root => false do
    attributes :id, :total, :team_id
  end
end
node  :champion do |match|
  match.have_winner
end if matches.count == 1
