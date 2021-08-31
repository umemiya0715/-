module api
  module v1
    AnalyzeddataController < ApplicationController
      before_action :set_analyzeddata, only: %i[show]

      def index
        @analyzeddata = Analyzeddata.all
        render json: @analyzeddata
      end

      def show
        render json: @analyzeddata
      end

    def create
      @analyzeddata = Analyzeddata.new(analyzeddata_params)
      @analyzeddata = @analyzeddata.emotionAnalyze
      if @analyzeddata.save
        render json: @analyzeddata
      else
        render json: @analyzeddata.errors, status: :bad_request
      end
    end

  private

  def set_analyzeddata
    @analyzeddata = analyzeddata.find(params[:id])
  end

  def analyzeddata_params
    params.require(:analyzeddata).permit(:analyzeddata)
  end
end
