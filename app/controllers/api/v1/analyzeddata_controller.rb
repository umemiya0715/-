module Api
  module V1
    class AnalyzeddataController < ApplicationController
      before_action :set_analyzeddatum, only: %i[show]
      after_action :set_csrf_token_header

      def index
        @analyzeddata = Analyzeddatum.all
        render json: @analyzeddata
      end

      def show
        render json: @analyzeddatum
      end

      def create
        @analyzeddatum = Analyzeddatum.new(analyzeddatum_params)
        @analyzeddata = @analyzeddatum.analyzeTweets
        if @analyzeddata.save
          render json: @analyzeddata
        else
          render json: @analyzeddata.errors, status: :bad_request
        end
      end

      private

      def set_analyzeddatum
        @analyzeddatum = analyzeddatum.find(params[:id])
      end

      def analyzeddatum_params
        params.require(:analyzeddatum).permit(:accountdata)
      end
    end
  end
end
