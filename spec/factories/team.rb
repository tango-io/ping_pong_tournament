FactoryGirl.define do 
  factory :invalid_team, :class => Team do |p|
  end
  factory :valid_team, :class => Team do |p|
    name "Test"
  end
end

