class AccountData < ApplicationRecord
  def collectData
    @user = twitter_client.user
    @tweets = twitter_client.user_timeline(:count => 200, :tweet_mode => 'extented')
    all_tweets_count = @user.statuses_count
    follower_point = FollowerAnalyzeService.call(@user)
    analysis = AccountAnalyzeService.call(@user, @tweets)
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