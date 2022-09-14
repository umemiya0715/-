# == Schema Information
#
# Table name: levels
#
#  id            :bigint           not null, primary key
#  current_level :integer          default(1), not null
#  experience    :integer          default(0), not null
#  leveluped_at  :datetime
#  setting_level :integer          default(1), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_levels_on_user_id  (user_id)
#
FactoryBot.define do
  factory :level do
    
  end
end
