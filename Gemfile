source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 6.1.6'
gem 'mysql2', '>= 0.5.3'
gem 'puma', '~> 4.3'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false

gem 'twitter'
gem 'google-cloud-language'
gem 'meta-tags'
gem 'sorcery'
gem 'config'
gem 'active_model_serializers'
gem 'administrate'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rspec-rails', '~> 5.0.0'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
end

group :test do
  gem 'capybara'
  gem 'webdrivers'
end