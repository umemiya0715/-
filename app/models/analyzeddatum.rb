class Analyzeddatum < ApplicationRecord
  def analyzeTweets
    require 'google/cloud/language'

    language = Google::Cloud::Language::V1::LanguageService::Client.new
    request = language.analyze_sentiment(content: "にゃんこ", type: :PLAIN_TEXT)

    response = request.document_sentiment

    score = response.score.to_f.round(1)
    maginitude = resonse.maginitude.to_f.round(1)
    put "Score: #{score}"
    put "Maginitude: #{maginitude}"
  end
end