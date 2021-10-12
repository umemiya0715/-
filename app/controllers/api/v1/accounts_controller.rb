module Api
  module V1
    class AccountsController < ApplicationController
      before_action :set_account, only: %i[show]

      def index
        @accounts = Account.all
        render json: @accounts
      end

      def show
        render json: @account
      end

      def create
        @account = Account.new(account_params)
        @user = client.user(@account.screen_name)
        @tweets = client.user_timeline(@user, :count => 3, :tweet_mode => 'extented')
        @account.mergeData(@user, @tweets)
        render json: @account
      end

      private

      def set_account
        @account = account.find(params[:id])
      end

      def account_params
        params.require(:account).permit(:screen_name)
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