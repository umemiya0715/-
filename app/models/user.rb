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
class User < ApplicationRecord
  before_save :modify_avatar_url
  authenticates_with_sorcery!

  has_one :authentication, dependent: :destroy
  has_many :results, dependent: :destroy
  has_one :level, dependent: :destroy

  accepts_nested_attributes_for :authentication

  enum role: { admin: 0, general: 1 }

  validates :twitter_id, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :screen_name, presence: true
  validates :role, presence: true

  private

  def modify_avatar_url
    image&.sub!(/_normal(.jpg|.jpeg|.gif|.png)/i) { Regexp.last_match[1] }
  end
end
