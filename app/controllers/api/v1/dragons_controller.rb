module Api
  module V1
    class DragonsController < ApplicationController
      before_action :set_dragon, only: %i[show]

      def show
        dragon = Dragon.find_by(id: params[:id])
        render json: dragon
      end

      def index
        dragons = Dragon.all
        render json: dragons
      end

      private

      def set_dragon
        @dragon = Dragon.find(params[:id])
      end
    end
  end
end
