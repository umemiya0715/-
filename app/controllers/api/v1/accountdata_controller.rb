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
        @accountdata = @accountdatum.fetchTweets
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
    end
  end
end