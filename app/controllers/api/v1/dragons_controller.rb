module Api
  module V1
    class dragonsController < ApplicationController
      before_action :set_dragon, only: %i[show]

      def index
        render json: Dragon.All
      end

      def show
        render json: @dragon.name
      end

      private

      def set_dragon
        @dragon = Dragon.find(params[:id])
      end
    end
  end
end