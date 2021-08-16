class AccountAnalyzeService
  include Service

  def initialize(user, tweets)
    @user = user
    @tweets = tweets
  end

  def call
    all_tweets_count = @user.statuses_count
    follower_point = FollowerAnalyzeService.call(@user)
  end
end