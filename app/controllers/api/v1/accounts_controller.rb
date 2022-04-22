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
        @tweets = client.user_timeline(@user, count: 5, exclude_replies: true, include_rts: false)
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

    end
  end
end