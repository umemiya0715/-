require 'rails_helper'

RSpec.describe 'Dragons', type: :request do
  describe 'GET /api/v1/dragons/:id' do
    before do
      get "/api/v1/dragons/1"
    end
    it '200 OKを返す' do
      expect(response.status).to eq 200
    end
    it 'Dragon.find_by(id: params[:id])のJSONを返す' do
      expect(json).to include({
        'id' => 1,
        'name' => "レッドドラゴン",
        'image' => "redDragon.png",
        'explanation' => "炎のように熱く燃える赤竜",
        'personality' => "このドラゴンが心の中に住んでるあなたは、正に心が燃えている真っ最中。何事にも精力的に取り組めており、周囲への影響力も大きいあなたは辺りを照らす炎のよう。",
        'advice' => "Twitterの使い方は順調な様子。熱くなりすぎて自他共に火傷しないように注意!",
        'affinity' => "呟きの傾向が近いイエロードラゴンの人とは相性がよさそう。活動力が低めなイエローの人を引っ張ってあげましょう。",
      })
    end
  end
end