class Result < ApplicationRecord
  belongs_to :user
  belongs_to :dragon

  validates :user_id, presence: true
  validates :dragon_id, presence: true
  validates :score, presence: true
  validates :magnitude, presence: true
  validates :troversion, presence: true
  validates :target_account, presence: true
  validates :screen_name, presence: true
end
