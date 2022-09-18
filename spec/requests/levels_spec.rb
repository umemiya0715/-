require 'rails_helper'

RSpec.describe 'Levels', type: :request do
  describe 'GET /api/v1/levels/:id' do
    let!(:user) { create(:user, id: 18) }
    let!(:level) { create(:level, user_id: 18) }
    before do
      get "/api/v1/levels/#{user.id}"
    end
    it '200 OKを返す' do
      expect(response.status).to eq 200
    end
  end

  describe 'PATCH /api/v1/levels/:id' do
    let!(:user) { create(:user, id: 18) }
    let!(:level) { create(:level, user_id: 18, current_level: 4) }
    before do
      patch "/api/v1/levels/#{user.id}", params: {
        level: { setting_level: 'レベル3' }
      }
    end
    it '200 OKを返す' do
      expect(response.status).to eq 200
    end
    it '設定したレベルを返す' do
      expect(json).to include({
        'id' => level.id,
        'user_id' => level.user_id,
        'current_level' => level.current_level,
        'experience' => level.experience,
        'setting_level' => 3,
      })
    end
  end

  describe 'GET /api/v1/levels/:id/levelup' do
    let!(:user) { create(:user, id: 18) }
    context 'leveluped_atの日付が今日より前' do
      let!(:level) { create(:level, user_id: 18, current_level: 3, setting_level: 2, experience: 13, leveluped_at: Date.yesterday) }
      before do
        get "/api/v1/levels/#{user.id}/levelup"
      end
      it '200 OKを返す' do
        expect(response.status).to eq 200
      end
      it 'experienceに応じたlevelを返す' do
        expect(json).to include({
          'id' => level.id,
          'user_id' => level.user_id,
          'current_level' => level.current_level + 1,
          'experience' => level.experience + 1,
          'setting_level' => level.current_level + 1,
        })
      end
    end

    context 'leveluped_atの日付が今日' do
      let!(:level) { create(:level, user_id: 18, current_level: 3, setting_level: 2, experience: 13, leveluped_at: Date.today) }
      before do
        get "/api/v1/levels/#{user.id}/levelup"
      end
      it 'experienceとlevelは増えない' do
        expect(json).to include({
          'id' => level.id,
          'user_id' => level.user_id,
          'current_level' => level.current_level,
          'experience' => level.experience,
          'setting_level' => level.setting_level
        })
      end
    end
  end
end
