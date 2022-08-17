# == Schema Information
#
# Table name: results
#
#  id             :bigint           not null, primary key
#  magnitude      :float(24)        not null
#  score          :float(24)        not null
#  screen_name    :string(255)      default(""), not null
#  target_account :string(255)      not null
#  troversion     :float(24)        not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  dragon_id      :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_results_on_dragon_id  (dragon_id)
#  index_results_on_user_id    (user_id)
#
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
