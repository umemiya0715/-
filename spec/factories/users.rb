# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  image       :string(255)
#  name        :string(255)      not null
#  role        :integer          default("general"), not null
#  screen_name :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  twitter_id  :string(255)      not null
#
# Indexes
#
#  index_users_on_twitter_id  (twitter_id) UNIQUE
#
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
