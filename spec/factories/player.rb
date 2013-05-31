FactoryGirl.define do 

  factory :player, :class => Player do |p|
    sequence(:type_account) {|n| "Twitter #{n}" }
    sequence(:user_account) {|n| "Test #{n}" }
    sequence(:email)        {|n| "Test#{n}@test.com" }
    picture_url "profile_picture.png"
  end
end
