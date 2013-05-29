collection matches, :root => "matches"
attributes :id, :match_number
child(:teams) { attributes :id, :name, :picture }
