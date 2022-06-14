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

    it 'personality: advice' do
      is_expected.to validate_presence_of(:advice)
    end
  end
end
