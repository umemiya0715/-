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
      improvedTweet = tweet.text.gsub(/#.*$|[ 　]+|\n|http.*:\/\/t.co\/\w*$/,"")
      document = { type: :PLAIN_TEXT, content: improvedTweet }
      response = client.analyze_sentiment(document: document)
      sentiment = response.document_sentiment
      resultScore.push(sentiment.score)
      resultMagnitude.push(sentiment.magnitude)
    end
    self.score = resultScore.sum(0.0) / resultScore.size
    self.magnitude = resultMagnitude.sum(0.0) / resultMagnitude.size
    self.troversion = ( 5 - tweets.count ) / 5
  end

  def whichDragon(score, magnitude)
    if score >= 0 and magnitude >= 0.5 and troversion >= 0.2
      dragonId = 1
    elsif score >= 0 and magnitude >= 0.5 and troversion < 0.2
      dragonId = 2
    elsif score >= 0 and magnitude < 0.5 and troversion >= 0.2
      dragonId = 3
    elsif score >= 0 and magnitude < 0.5 and troversion < 0.2
      dragonId = 4
    elsif score < 0 and magnitude >= 0.5 and troversion >= 0.2
      dragonId = 5
    elsif score < 0 and magnitude >= 0.5 and troversion < 0.2
      dragonId = 6
    elsif score < 0 and magnitude < 0.5 and troversion >= 0.2
      dragonId = 7
    elsif score < 0 and magnitude < 0.5 and troversion < 0.2
      dragonId = 8
    end
    self.dragonId = dragonId
  end
end