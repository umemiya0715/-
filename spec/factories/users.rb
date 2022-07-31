FactoryBot.define do
  factory :user do
    twitter_id { rand(1..20) }
    sequence(:name, 'user_1')
    screen_name { 'user_1' }
    role { 1 }
  end

  trait :new do
    name { 'bahamut' }
    screen_name { 'bahamut0731' }
  end
end