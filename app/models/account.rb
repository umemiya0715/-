class Account < ApplicationRecord
  attribute :user, :string
  attribute :tweets, :string
  attribute :score, :float
  attribute :magnitude, :float
  attribute :troversion, :integer

  def mergeData(user, tweets)
    sentimentAnalyze(user, tweets)
    self.user = user
    self.tweets = tweets
  end

  def sentimentAnalyze(user, tweets)
    require "google/cloud/language"
    client = Google::Cloud::Language.language_service do |config|
      config.credentials = "/Users/umemiyashouta/Downloads/emotion-analysis-321715-19cecea1a816.json"
    end
    resultScore = []
    resultMagnitude = []
    tweets.each do |tweet|
      document = { type: :PLAIN_TEXT, content: tweet.text }
      response = client.analyze_sentiment(document: document)
      sentiment = response.document_sentiment
      resultScore.push(sentiment.score)
      resultMagnitude.push(sentiment.magnitude)
    end
    self.score = resultScore.sum(0.0) / resultScore.size
    self.magnitude = resultMagnitude.sum(0.0) / resultMagnitude.size
  end
end