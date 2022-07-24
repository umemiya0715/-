class ResultSerializer < ActiveModel::Serializer
  attributes :id, :dragon_id, :user_id, :target_account, :screen_name, :score, :magnitude, :troversion, :created_at

  belongs_to :dragon
end
