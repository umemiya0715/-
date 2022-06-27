class User < ApplicationRecord
  authenticates_with_sorcery!

  has_one :authentication, dependent: :destroy
  has_many :results

  accepts_nested_attributes_for :authentication

  enum role: { admin: 0, general: 1 }

  validates :twitter_id, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :screen_name, presence: true
  validates :role, presence: true
end
