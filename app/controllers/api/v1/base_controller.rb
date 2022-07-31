class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  rescue_from Twitter::Error::NotFound, with: :rescue_twitter_not_found
  rescue_from Twitter::Error::TooManyRequests, with: :rescue_limited_twitter_requests
  rescue_from Twitter::Error::Unauthorized,
              with: :rescue_not_found_authentication
  rescue_from Google::Cloud::ResourceExhaustedError, with: :rescue_exhausted_error

  def rescue_twitter_not_found
    error_json = {
      'code' => 404,
      'title' => '対象のアカウントは存在しません',
      'messages' => ['入力したIDをもう一度確認ください']
    }
    render json: { error: error_json }, status: :not_found
  end

  def rescue_limited_twitter_requests
    error_json = {
      'code' => 429,
      'title' => 'TwitterAPIの制限に達しました',
      'messages' => ['リクエストが集中しています。再度15分後にお試しください']
    }
    render json: { error: error_json }, status: :too_many_requests
  end

  def rescue_not_found_authentication
    error_json = {
      'code' => 400,
      'title' => 'Twitter認証情報が無効です',
      'messages' => ['再ログインをお試しください']
    }
    render json: { error: error_json }, status: :bad_request
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
