class Dragon < ApplicationRecord
  has_many :results

  validates :name, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :personality, presence: true
  validates :advice, presence: true

end