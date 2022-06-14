FactoryBot.define do
  factory :authentication do
    sequence(:uid, 'uid_1')
    provider { 'twitter' }
    association :user
  end
end