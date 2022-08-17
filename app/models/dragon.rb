# == Schema Information
#
# Table name: dragons
#
#  id          :bigint           not null, primary key
#  advice      :string(255)      not null
#  affinity    :string(255)      not null
#  explanation :string(255)      not null
#  image       :string(255)      not null
#  name        :string(255)      not null
#  personality :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Dragon < ApplicationRecord
  has_many :results, dependent: :nullify

  validates :name, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :personality, presence: true
  validates :advice, presence: true
  validates :affinity, presence: true
end
