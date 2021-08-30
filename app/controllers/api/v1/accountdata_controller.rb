module Api
  module V1
    class AccountdataController < ApplicationController
      before_action :set_accountdata, only: %i[show]

      def index
        @accountdata = Accountdata.all
        render json: @accountdata
      end

      def show
        render json: @accountdata
      end

      def create
        @accountdata = Accountdata.new(accountdata_params)
        @accountdata = @accountdata.collectdata
        if @accountdata.save
          render json: @accountdata
        else
          render json: @accountdata.errors, status: :bad_request
        end
      end

      private

      def set_accountdata
        @accountdata = accountdata.find(params[:id])
      end

      def accountdata_params
        params.require(:accountdata).permit(:accountdata)
      end
    end
  end
end