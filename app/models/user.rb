class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  has_many :results, dependent: destroy
  accepts_nested_attributes_for :authentications

  validates :twitter_id, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :role, presence: true
end
