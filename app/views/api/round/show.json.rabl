collection matches
attributes :id, :match_number
child :teams, :object_root => false do
  attributes :id, :name
  child :players, :object_root => false do | team |
    attributes :user_account, :email, :type_account, :picture_url
  end
  node :picture_url, :object_root => false do | team |
    if team.picture.thumb.url.nil?
      '/pads.jpg'
    else
      team.picture.thumb.url
    end
  end
end
child :sets, :object_root => false do
  attributes :id, :set_number
  child :scores, :object_root => false do
    attributes :id, :total, :team_id
    node(:visible) { |score| true if score.total != nil }
  end
end
child @champion => :champion do
  attributes :id, :name
  child :players, :object_root => false do | team |
    attributes :user_account, :type_account, :picture_url
  end
  node :picture_url, :object_root => false do | team |
    if team.picture.url.nil?
      '/assets/pads.jpg'
    else
      team.picture.url
    end
  end
end
