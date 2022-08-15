class User < ApplicationRecord
  before_save :modify_avatar_url
  authenticates_with_sorcery!

  has_one :authentication, dependent: :destroy
  has_many :results, dependent: :destroy

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
