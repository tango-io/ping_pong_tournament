FactoryGirl.define do 
  factory :team, :class => Team do |p|
    name "Test"
    picture {{
      small:  "team_picture_small.png",
      normal: "team_picture_normal.png",
      big:    "team_picture_big.png"
    }}
    players {[ FactoryGirl.build(:player), FactoryGirl.build(:player) ]}
  end
end

