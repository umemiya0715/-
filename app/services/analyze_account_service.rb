class AnalyzeAccountService

  def initialize(target, tweets, user)
    @target = target
    @tweets = tweets
    @user = user
  end

  def call
    require "google/cloud/language"
    client = Google::Cloud::Language.language_service do |config|
      if Rails.env.production?
        config.credentials = JSON.parse(ENV.fetch('GOOGLE_CREDENTIALS'))
      else
        config.credentials = "/Users/umemiyashouta/Downloads/dragon-twitter-analysis.json"
      end
    end
    resultScore = []
    resultMagnitude = []
    @tweets.each do |tweet|
      improvedTweet = tweet.text.gsub(/#.*$|[ 　]+|\n|http.*:\/\/t.co\/\w*$/,"")
      document = { type: :PLAIN_TEXT, content: improvedTweet }
      response = client.analyze_sentiment(document: document)
      sentiment = response.document_sentiment
      resultScore.push(sentiment.score)
      resultMagnitude.push(sentiment.magnitude)
    end
    user_id = @user
    target_account = @target.name
    screen_name = '@' + @target.screen_name
    score = ( resultScore.sum(0.0) / resultScore.size ).floor(2)
    magnitude = ( resultMagnitude.sum(0.0) / resultMagnitude.size ).floor(2)
    troversion = CalculateTroversionService.new(@target, @tweets).call
    dragon_id = JudgeDragonService.new(score, magnitude, troversion).call

    {
      user_id: user_id,
      dragon_id: dragon_id,
      target_account: target_account,
      screen_name: screen_name,
      score: score,
      magnitude: magnitude,
      troversion: troversion,
    }
  end
end