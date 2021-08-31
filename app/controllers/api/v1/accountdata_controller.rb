module Api
  module V1
    class AccountdataController < ApplicationController
      before_action :set_accountdata, only: %i[show]

      def index
        @user = client.user(accountdata)
        @tweets = client.user_timeline(:count => 200, :tweet_mode => 'extended')
        render json: @accountdata
      end

      def show
        @user = client.user(accountdata)
        @tweets = client.user_timeline(:count => 200, :tweet_mode => 'extended')
        # analysis = UserAnalysisService.call(@user, @tweets)
        # @result = TweetAnalyzeService.call(@user, @tweets, analysis)
        render json: @accountdata
      end

      private

      def set_accountdata
        @accountdata = accountdata.find(params[:id])
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
  end
end