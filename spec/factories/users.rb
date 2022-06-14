FactoryBot.define do
  factory :user do
    twitter_id { rand(1..20) }
    sequence(:name, 'user_1')
    screen_name { 'leviathan' }
    role { 1 }
  end
end