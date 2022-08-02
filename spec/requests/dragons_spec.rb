require 'rails_helper'

RSpec.describe 'Dragons', type: :request do
  describe 'GET /api/v1/dragons/:id' do
    let!(:dragon) { create(:dragon, :red)}
    before do
      get "/api/v1/dragons/#{dragon.id}"
    end
    it '200 OKを返す' do
      expect(response.status).to eq 200
    end
    it 'Dragon.find_by(id: params[:id])のJSONを返す' do
      expect(json).to eq({
        'id' => dragon.id,
        'name' => dragon.name,
        'image' => dragon.image,
        'explanation' => dragon.explanation,
        'personality' => dragon.personality,
        'advice' => dragon.advice,
        'affinity' => dragon.affinity,
        'results' => [],
      })
    end
  end
end