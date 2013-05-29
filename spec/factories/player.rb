FactoryGirl.define do 

  factory :player, :class => Player do |p|
    sequence(:name)         {|n| "Test #{n}" }
    sequence(:type_account) {|n| "Twitter #{n}" }
    sequence(:user_account) {|n| "Test #{n}" }
    sequence(:email)        {|n| "Test#{n}@test.com" }
  end
end
