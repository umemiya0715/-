module Api
  module V1
    class AccountDataController < ApplicationController
      before_action :set_accountData, only: %i[show]

      def index
        @accountData = AccountData.all
        render json: @accountData
      end

      def show
        render json: @accountData
      end

      def create
        @accountData = AccountData.new(accountData_params)
        byebug
        @accountData = @accountData.collectData
        if @accountData.save
          render json: @accountData
        else
          render json: @accountData.errors, status: :bad_request
        end
      end

      private

      def set_accountData
        @accountData = accountData.find(params[:id])
      end

      def accountData_params
        params.require(:accountData).permit(:accountData)
      end
    end
  end
end