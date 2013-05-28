FactoryGirl.define do 
  factory :player, :class => Player do |p|
    name "Test"
    type_account "twitter"
    user_account "tenderlove" 
    email "test@test.com"
  end
end
