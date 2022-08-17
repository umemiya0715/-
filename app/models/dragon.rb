class Dragon < ApplicationRecord
  has_many :results, dependent: :nullify

  validates :name, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :personality, presence: true
  validates :advice, presence: true
  validates :affinity, presence: true
end
