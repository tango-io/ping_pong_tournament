FactoryGirl.define do 
  factory :invalid_team, :class => Team do |p|
  end

  factory :valid_team, :class => Team do |p|
    name "Test"
    factory :team_with_players, :class => Team do |t|
      players {[FactoryGirl.create(:valid_player)]}
    end
  end
end

