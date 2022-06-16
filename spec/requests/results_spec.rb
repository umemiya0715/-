require 'rails_helper'

RSpec.describe 'Results', type: :request do
  describe 'GET /api/v1/results/:twitter_id/previous_results' do
    let(:user) { create(:user, twitter_id: 23) }
    let!(:red_dragon) { create(:dragon, :red) }
    before do
      login_as(user)
      results = create_list(:result, 5, user_id: 23, dragon_id: 1 )
      get '/api/v1/results/user.twitter_id/previous_results'
    end
    it '200 OKを返す' do
      expect(response.status).to eq 200
    end
    xit '5つ分の診断結果を返す' do
      response_json = JSON.parse(response.body)
      expect(response_json.length).to eq 5
    end
  end
end