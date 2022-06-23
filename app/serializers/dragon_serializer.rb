class DragonSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :explanation, :personality, :advice, :affinity

  has_many :results
end
