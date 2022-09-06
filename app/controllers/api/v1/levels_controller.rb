module Api
  module V1
    class LevelsController < Api::V1::BaseController
      def create
        @level = Level.new(user_id: params[])
        if @level.save!
          render json: @level, status: :ok
        else
          render json: @level, status: :bad_request
        end
      end

      def show
        level = Level.find_by!(user_id: params[:id])
        render json: level
      end

      def update
      end
    end
  end
end
