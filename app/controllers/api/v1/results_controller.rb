module Api
  module V1
    class ResultsController < ApplicationController
      before_action :set_result, only: %i[show]

      def previous_results
        @results = Result.includes(:dragon).where(user_id: params[:id]).order(created_at: :desc)
        render json: @results, include: [:dragon], status: 200
      end

      def index
      end

      def show
        render json: @result, include: [:dragon], status: 200
      end

      def create
        target_id = result_params['target_account']
        target = client.user(target_id)
        tweets = client.user_timeline(target, count: 20, exclude_replies: true, include_rts: false)
        user = result_params['user_id']
        analyzed_result = Result.analyzeResult(target, tweets, user)
        @result = Result.new(analyzed_result)
        if @result.user_id == 0 then
          render json: @result
        elsif @result.save then
          render json: @result, status: :created
        else
          render json: @result, status: :bad_request
        end
      end

      private

      def set_result
        @result = Result.find_by(id: params[:id])
      end

      def result_params
        params.require(:result).permit(:user_id, :dragon_id, :score, :magnitude, :troversion, :target_account)
      end

    end
  end
end
