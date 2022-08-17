require 'rails_helper'

RSpec.describe 'UserSettings', type: :request do
  describe 'PATCH /api/v1/user_settings' do
    let(:user) { create(:user, screen_name: 'Umesho0415') }
    before { login_as(user) }
    context '正常系' do
      let(:user) { create(:user, :new) }
      before { patch '/api/v1/user_settings' }
      it '200 OKを返す' do
        expect(response.status).to eq 200
      end
      it 'userのデータが更新される' do
        updated_user = user.reload
        expect(updated_user.name).to eq 'bahamut'
        expect(updated_user.screen_name).to eq 'bahamut0731'
      end
      it 'userのJSONを返す' do
        updated_user = user.reload
        expect(json).to eq({
          'id' => updated_user.id,
          'name' => updated_user.name,
          'screen_name' => updated_user.screen_name,
          'twitter_id' => updated_user.twitter_id,
          'image' => updated_user.image,
          'role' => updated_user.role,
        })
      end
    end
  end

  describe 'DELETE /api/v1/user_settings' do
    let!(:user) { create(:user) }
    before { login_as(user) }
    it '204 NoContentを返す' do
      delete '/api/v1/user_settings'
      expect(response.status).to eq 204
    end
    it 'Userを削除する' do
      expect do
        delete '/api/v1/user_settings'
      end.to change(User, :count).by(-1)
    end
  end
end