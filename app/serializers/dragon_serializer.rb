class DragonSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :explanation, :personality, :advice

  has_many :results
end
