FactoryBot.define do
  factory :result do
    dragon
    target_account { 'leviathan' }
    score { '0.5' }
    magnitude { '0.5' }
    troversion { '0.5' }
    association :user
  end
end