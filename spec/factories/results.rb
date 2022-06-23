FactoryBot.define do
  factory :result do
    dragon_id { 1 }
    user_id { 0 }
    target_account { 'leviathan' }
    score { '0.5' }
    magnitude { '0.5' }
    troversion { '0.3' }
  end
end