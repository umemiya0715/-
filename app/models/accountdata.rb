class AccountData < ApplicationRecord
  def fetchData
    @user = client.user
    @tweets = client.user_timeline(:count => 200, :tweet_mode => 'extented')
    analysis = UserAnalyzeService.call(@user, @tweets)
    @result = TweetsAnalyzeService.call(@user, @tweets, analysis)
    name = @user.name
    @screen_name = @user.screen_name
    @share_tweet = TweetShareService.call(name, @result)
  end

  private

  def client
    @client ||= Twitter::REST::client.new do |config|
      config.consumer_key = Rails.application.credentials.twitter[:consumer_key]
      config.consumer_secret = Rails.application.credentials.twitter[:consumer_secret]
      config.access_token = Rails.application.credentials.twitter[:access_token]
      config.access_token_secret = Rails.application.credentials.twitter[:access_token_secret]
    end
  end
end