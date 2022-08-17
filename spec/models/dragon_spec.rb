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
require 'rails_helper'

RSpec.describe Dragon, type: :model do
  describe 'validations' do
    it 'name: presence' do
      is_expected.to validate_presence_of(:name)
    end

    it 'image: presence' do
      is_expected.to validate_presence_of(:image)
    end

    it 'explanation: presence' do
      is_expected.to validate_presence_of(:explanation)
    end

    it 'personality: presence' do
      is_expected.to validate_presence_of(:personality)
    end

    it 'advice: presence' do
      is_expected.to validate_presence_of(:advice)
    end

    it 'affinity: presence' do
      is_expected.to validate_presence_of(:affinity)
    end
  end
end
