require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /api/v1/users/me' do
    let(:user) { create(:user) }
    before do
      login_as(user)
      get '/api/v1/users/me'
    end
    it '200 OKを返す' do
      expect(response.status).to eq 200
    end
  end

  describe 'PATCH /api/v1/user_settings' do
    let(:user) { create(:user) }
    let(:user_json) { user.to_json }
    context 'ログイン中' do
      before { login_as(user) }
      context '正常系' do
        let(:user) { create(:user, name: 'Fafnir', screen_name: 'Fafnir') }
        before { get '/api/v1/user_settings' }
        it '200 OKを返す' do
          expect(response.status).to eq 200
        end
        it 'userのデータが更新される' do
          updated_user = user.reload
          expect(updated_user.name).to eq 'Fafnir'
          expect(updated_user.screen_name).to eq 'Fafnir'
        end
<<<<<<< Updated upstream
        xit 'userのJSONを返す' do
=======
        fit 'userのJSONを返す' do
>>>>>>> Stashed changes
          updated_user = user.reload
          expect(JSON.parse(user_json)).to include({
            'name' => updated_user.name,
            'screen_name' => updated_user.screen_name,
            'twitter_id' => updated_user.twitter_id,
            'role' => updated_user.role,
          })
        end
      end
    end
  end

  describe 'DELETE /api/v1/user_settings' do
    let(:user) { create(:user) }
    before do
      login_as(user)
      delete '/api/v1/user_settings'
    end
    it '204 NoContentを返す' do
      expect(response.status).to eq 204
    end
  end
end
