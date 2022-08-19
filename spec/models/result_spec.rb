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
require 'rails_helper'

RSpec.describe Result, type: :model do
  describe 'associations' do
    it 'belongs_to :dragon' do
      is_expected.to belong_to(:dragon)
    end
  end

  describe 'validations' do
    it 'target_account: presence' do
      is_expected.to validate_presence_of(:target_account)
    end

    it 'screen_name: presence' do
      is_expected.to validate_presence_of(:screen_name)
    end

    it 'score: presence' do
      is_expected.to validate_presence_of(:score)
    end

    it 'magnitude: presence' do
      is_expected.to validate_presence_of(:magnitude)
    end

    it 'troversion: presence' do
      is_expected.to validate_presence_of(:troversion)
    end
  end
end
