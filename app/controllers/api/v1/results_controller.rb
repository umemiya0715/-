module Api
  module V1
    class ResultsController < ApplicationController
      before_action :set_result, only: %i[show]

      def index
        @result = Result.all
        render json: @result
      end

      def show
        render json: @result
      end

      private

      def set_result
        @result = Result.find(params[:id])
      end
    end
  end
end
