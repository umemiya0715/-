require 'rails_helper'

RSpec.describe "TopPages", type: :system do
  context 'トップページにアクセス' do
    before { visit root_path }
    it '診断ボタンが表示されていること' do
      expect(page).to have_content('診断する'), '「診断する」ボタンが表示されていません'
    end

    it 'ヘッダーが表示されていること' do
      expect(page).to have_content('Twitter認証によるユーザー登録'), '「Twitter認証によるユーザー登録」が表示されていません'
    end

    it 'フッターが表示されていること' do
      expect(page).to have_content('利用規約'), '「利用規約」が表示されていません'
      expect(page).to have_content('プライバシーポリシー'), '「プライバシーポリシー」が表示されていません'
    end
  end
end
