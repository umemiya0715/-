class EmotionAnalyzeService
  include Service

  def initialize(user, tweets)
    @user = user
    @tweets = tweets
    @analysis = analysis
  end

  def call
    all_tweets_count = @user.statuses_count
    troversion = FollowerAnalyzeService.call(@user)
    emotion = emotionAnalyzeService.call
    result = DragonJudgeService.call(troversion,polarity, magnitude)

    result
  end
end