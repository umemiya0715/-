module Api
  module V1
    class DragonsController < ApplicationController
      before_action :set_dragon, only: %i[show]

      def show
        user = Dragon.find_by(id: params[:id])
        render json: user
      end

      private

      def set_dragon
        @dragon = Dragon.find(params[:id])
      end
    end
  end
end
