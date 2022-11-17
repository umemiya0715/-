source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.3'
gem 'mysql2', '>= 0.5.3'
gem 'puma', '~> 4.3'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false

# TwitterのAPI
gem 'twitter'
# 感情分析のAPI
gem 'google-cloud-language'
# SEO対策
gem 'meta-tags'
# ログイン機能
gem 'sorcery'
# コールバックの定数管理
gem 'config'
# JSONの加工
gem 'active_model_serializers'
# 管理画面
gem 'administrate'
# 初期データ(テスト用)
gem 'seed-fu'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  # N+1問題検知
  gem 'bullet'
  # モデルのスキーマ情報
  gem 'annotate'
end

group :test do
  gem 'capybara'
  # modelスペック用
  gem 'shoulda-matchers'
  gem 'webdrivers'
  # APIテスト用
  gem 'vcr', require: false
  gem 'webmock', require: false
end
