object match
attributes :match_number
child(:teams) {attributes :id, :name, :picture }
child(:sets) { 
  attributes :id, :set_number
  child(:scores) { attributes :id, :total }
}
