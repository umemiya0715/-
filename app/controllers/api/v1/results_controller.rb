module Api
  module V1
    class ResultsController < ApplicationController
      before_action :set_result, only: %i[show]

      def index
        @results = Result.all
        render json: @results
      end

      def show
        render json: @result
      end

      def create
        user_id = result_params['user_id']
        user = client.user(user_id)
        tweets = client.user_timeline(user, count: 5, exclude_replies: true, include_rts: false)
        analyzed_result = Result.analyzeResult(user, tweets)
        @result = Result.new(analyzed_result)
        if @result.save
          render json: @result, status: :created
        else
          render json: @result, status: :bad_request
        end
      end

      private

      def set_result
        @result = account.find(params[:id])
      end

      def result_params
        params.require(:result).permit(:user_id, :dragon_id, :score, :magnitude, :troversion)
      end

    end
  end
end
