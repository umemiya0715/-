require 'rails_helper'

RSpec.describe 'Base', type: :request do
  describe '#rescue_twitter_not_found' do
    context '存在しないアカウントを診断した場合' do
      before do
        post '/api/v1/results', params: {
          result: { target_account: '@@@', user_id: 0 }
        }
      end
      it '404 Not Foundを返す' do
        expect(response.status).to eq 404
      end
      it 'エラーメッセージのJSONを返す' do
        expect(json['error']).to eq ({
          'code' => 404,
          'title' => '対象のアカウントは存在しません',
          'messages' => ['入力したIDをもう一度確認ください']
        })
      end
    end
  end

  describe '#rescue_not_found' do
    context '存在しないドラゴンのリソースにアクセスした場合' do
      before { get '/api/v1/dragons/lindwurm' }
      it '404 Not Foundを返す' do
        expect(response.status).to eq 404
      end
      it 'エラーメッセージのJSONを返す' do
        expect(json['error']).to eq({
          'code' => 404,
          'title' => 'リソースが見つかりませんでした',
          'messages' => ['データが見つかりませんでした。アドレスを確認してください']
        })
      end
    end
    context '存在しないユーザーのリソースにアクセスした場合' do
      before { get '/api/v1/users/zmei' }
      it '404 Not Found' do
        expect(response.status).to eq 404
      end
      it 'エラーメッセージのJSONを返す' do
        expect(json['error']).to eq({
          'code' => 404,
          'title' => 'リソースが見つかりませんでした',
          'messages' => ['データが見つかりませんでした。アドレスを確認してください']
        })
      end
    end
    context '存在しない診断結果のリソースにアクセスした場合' do
      before { get '/api/v1/results/qinglong' }
      it '404 Not Found' do
        expect(response.status).to eq 404
      end
      it 'エラーメッセージのJSONを返す' do
        expect(json['error']).to eq({
          'code' => 404,
          'title' => 'リソースが見つかりませんでした',
          'messages' => ['データが見つかりませんでした。アドレスを確認してください']
        })
      end
    end
  end
end