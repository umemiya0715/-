# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  image       :string(255)
#  name        :string(255)      not null
#  role        :integer          default("general"), not null
#  screen_name :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  twitter_id  :string(255)      not null
#
# Indexes
#
#  index_users_on_twitter_id  (twitter_id) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'test_data_validation' do
    it 'test_data_is_valid' do
      expect(user).to be_valid
    end
  end

  describe 'associations' do
    it 'has_one :authentication, destroy' do
      is_expected.to have_one(:authentication).dependent(:destroy)
    end

    it 'has_many :results' do
      is_expected.to have_many(:results).dependent(:destroy)
    end

    it 'has_one :level, destroy' do
      is_expected.to have_one(:level).dependent(:destroy)
    end
  end

  describe 'validations' do
    before { create(:user) }

    it 'twitter_id: presence' do
      is_expected.to validate_presence_of(:twitter_id)
    end

    it 'twitter_id: uniqueness' do
      is_expected.to validate_uniqueness_of(:twitter_id).case_insensitive
    end

    it 'screen_name: presence' do
      is_expected.to validate_presence_of(:screen_name)
    end

    it 'name: presence' do
      is_expected.to validate_presence_of(:name)
    end

    it 'name: length < 50' do
      is_expected.to validate_length_of(:name).is_at_most(50)
    end

    it 'role: presence' do
      is_expected.to validate_presence_of(:role)
    end
  end
end
