# == Schema Information
#
# Table name: results
#
#  id             :bigint           not null, primary key
#  magnitude      :float(24)        not null
#  score          :float(24)        not null
#  screen_name    :string(255)      default(""), not null
#  target_account :string(255)      not null
#  troversion     :float(24)        not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  dragon_id      :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_results_on_dragon_id  (dragon_id)
#  index_results_on_user_id    (user_id)
#
FactoryBot.define do
  factory :result do
    dragon_id { 1 }
    user_id { 0 }
    target_account { 'leviathan' }
    score { '0.5' }
    magnitude { '0.5' }
    troversion { '0.3' }
    screen_name { 'leviathan723' }
  end
end
