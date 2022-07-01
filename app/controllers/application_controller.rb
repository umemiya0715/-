class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  rescue_from Twitter::Error::NotFound, with: :rescue_twitter_not_found
  rescue_from Google::Cloud::ResourceExhaustedError, with: :rescue_exhausted_error

  def rescue_twitter_not_found
    error_json = {
      'code' => 404,
      'title' => '対象のアカウントは存在しません',
      'messages' => ['入力したIDをもう一度確認ください']
    }
    render json: { error: error_json }, status: :not_found
  end

  def rescue_exhausted_error
    error_json = {
      'code' => 429,
      'title' => 'GoogleAPIの制限に達しました',
      'messages' => ['リクエストが集中しています。再度15分後にお試しください']
    }
    render json: { error: error_json }, status: :too_many_requests
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.credentials.twitter[:consumer_key]
      config.consumer_secret = Rails.application.credentials.twitter[:consumer_secret]
      config.access_token = Rails.application.credentials.twitter[:access_token]
      config.access_token_secret = Rails.application.credentials.twitter[:access_token_secret]
    end
  end
end
