FactoryBot.define do
  factory :result do
    target_account { 'leviathan' }
    score { '0.5' }
    magnitude { '0.5' }
    troversion { '0.3' }
    association :user
    association :dragon
  end
end