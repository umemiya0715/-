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
