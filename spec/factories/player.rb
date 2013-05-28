FactoryGirl.define do 
  factory :invalid_player, :class => Player do |p|
  end
  factory :valid_player, :class => Player do |p|
    name "Test"
    type_account "twitter"
    user_account "tenderlove" 
    email "test@test.com"
  end
end
