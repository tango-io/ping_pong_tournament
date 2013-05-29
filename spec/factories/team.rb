FactoryGirl.define do 
  factory :team, :class => Team do |p|
    name "Test"
    players {[ FactoryGirl.build(:player, picture_url: { small: "profile_picture_small.png", normal: "profile_picture_normal.png", big: "profile_picture_big.png"}) ]}
  end
end

