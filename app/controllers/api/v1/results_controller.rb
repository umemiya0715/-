module Api
  module V1
    class ResultsController < ApplicationController
      before_action :set_result, only: %i[show update destroy]

      def index
        @result = Result.all
        render json: @result
      end

      def show
        render json: @result
      end

      def create
        @result = Result.new(result_params)
        @result = @result.analyze
        if @result.save
          render json: @result
        else
          render json: @result.errors, status: :bad_request
        end
      end

      private

      def set_result
        @result = Result.find(params[:id])
      end

      def result_params
        params.require(:result).permit(:result)
      end
    end
  end
end
