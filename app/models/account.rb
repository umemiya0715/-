class Account < ApplicationRecord
  attribute :user, :string
  attribute :tweets, :string
  attribute :score, :float
  attribute :magnitude, :float
  attribute :troversion, :integer
  attribute :dragonId, :integer

  def mergeData(user, tweets)
    sentimentAnalyze(user, tweets)
    whichDragon(self.score, self.magnitude)
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

  def whichDragon(score, magnitude)
    if score > 0 and maginitude > 0
      dragonId = 1
    elsif score > 0 and maginitude < 0
      dragonId = 2
    elsif score < 0 and magnitude > 0
      dragonId = 3
    else
      dragonId = 4
    end
    self.dragonId = dragonId
  end
end