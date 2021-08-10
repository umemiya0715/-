class TweetsAnalyzeService
  include Service

  def initialize(user, tweets, analysis)
    @user = user
    @tweets = tweets
    @analysis = analysis
  end

  def call
    all_tweets_count = @user.statuses_count
    follower_point = FollowerAnalyzeService.call(@user)
  end
end