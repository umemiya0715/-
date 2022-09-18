# == Schema Information
#
# Table name: levels
#
#  id            :bigint           not null, primary key
#  current_level :integer          default(1), not null
#  experience    :integer          default(0), not null
#  leveluped_at  :datetime
#  setting_level :integer          default(1), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_levels_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Level, type: :model do
  describe 'validations' do
    it 'current_level: presence' do
      is_expected.to validate_presence_of(:current_level)
    end

    it 'experience: presence' do
      is_expected.to validate_presence_of(:experience)
    end

    it 'setting_level: presence' do
      is_expected.to validate_presence_of(:setting_level)
    end

  end
end
