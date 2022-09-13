class AnalyzeAccountService
  def initialize(target, tweets, user)
    @target = target
    @tweets = tweets
    @user = user
  end

  def call
    require 'google/cloud/language'
    client = Google::Cloud::Language.language_service do |config|
      if Rails.env.production?
        config.credentials = JSON.parse(ENV.fetch('GOOGLE_CREDENTIALS'))
      else
        config.credentials = '/Users/umemiyashouta/Documents/workplace/emotion-dragon/gcs_credentials.json'
      end
    end
    result_score = []
    result_magnitude = []
    @tweets.each do |tweet|
      improved_tweet = tweet.text.gsub(/#.*$|[ 　]+|\n|http.*:\/\/t.co\/\w*$/, '')
      document = { type: :PLAIN_TEXT, content: improved_tweet }
      response = client.analyze_sentiment(document:)
      sentiment = response.document_sentiment
      result_score.push(sentiment.score)
      result_magnitude.push(sentiment.magnitude)
    end
    user_id = @user
    target_account = @target.name
    screen_name = @target.screen_name
    score = (result_score.sum(0.0) / result_score.size).floor(2)
    magnitude = (result_magnitude.sum(0.0) / result_magnitude.size).floor(2)
    troversion = CalculateTroversionService.new(@target, @tweets).call
    dragon_id = JudgeDragonService.new(score, magnitude, troversion).call

    {
      user_id:,
      dragon_id:,
      target_account:,
      screen_name:,
      score:,
      magnitude:,
      troversion:
    }
  end
end
