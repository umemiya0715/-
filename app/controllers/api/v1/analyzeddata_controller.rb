class Api::v1::AnalyzedDataController < ApplicationController
  before_action :set_analyzedData, only: %i[show]

  def index
    @analyzedData = AnalyzedData.all
    render json: @analyzedData
  end

  def show
    render json: @analyzedData
  end

  def create
    @analyzedData = AnalyzedData.new(analyzedData_params)
    @analyzedData = @analyzedData.emotionAnalyze
    if @analyzedData.save
      render json: @analyzedData
    else
      render json: @analyzedData.errors, status: :bad_request
    end
  end

  private

  def set_analyzedData
    @analyzedData = analyzedData.find(params[:id])
  end

  def analyzedData_params
    params.require(:analyzedData).permit(:analyzedData)
  end
end
