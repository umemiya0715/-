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
class DragonSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :explanation, :personality, :advice, :affinity

  has_many :results
end
