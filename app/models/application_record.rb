class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def twitter_client
    @twitter_client ||= Twitter::REST::client.new do |config|
      config.consumer_key = Rails.application.credentials.twitter[:consumer_key]
      config.consumer_secret = Rails.application.credentials.twitter[:consumer_secret]
      config.access_token = Rails.application.credentials.twitter[:access_token]
      config.access_token_secret = Rails.application.credentials.twitter[:access_token_secret]
    end
  end
end
