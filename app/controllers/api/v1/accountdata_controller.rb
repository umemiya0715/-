module Api
  module V1
    class AccountdataController < ApplicationController
      before_action :set_accountdatum, only: %i[show]

      def index
        @accountdata = Acccountdatum.all
        render json: @accountdata
      end

      def show
        render json: @accountdatum
      end

      def create
        @accountdatum = Accountdatum.new(accountdatum_params)
        @user = client.user(@accountdatum.accountdata)
        @tweets = client.user_timeline(@user, :count => 50, :tweet_mode => 'extented')
        @accountdata = @accountdatum.mergeData(@user, @tweets)
        if @accountdatum.save
          render json: @accountdata
        else
          render json: @accountdatum.errors, status: :bad_request
        end
      end

      private

      def set_accountdatum
        @accountdatum = accountdatum.find(params[:id])
      end

      def accountdatum_params
        params.require(:accountdatum).permit(:accountdata)
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