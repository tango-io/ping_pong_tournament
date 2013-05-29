FactoryGirl.define do 
  factory :match, :class => Match do |m|
    match_number 1
    round { FactoryGirl.create(:round) }
    teams { [FactoryGirl.create(:team, picture: {} ), FactoryGirl.create(:team, picture: {})] } 
  end
end
