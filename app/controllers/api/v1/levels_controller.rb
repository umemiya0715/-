module Api
  module V1
    class LevelsController < Api::V1::BaseController
      before_action :set_level, only: [:show, :update, :levelup]

      def show
        render json: @level
      end

      def update
        setting_level = level_params['setting_level'].gsub(/レベル/, "").to_i
        if @level.current_level >= setting_level
          @level.update(setting_level: setting_level)
        end
        render json: @level
      end

      def levelup
        LevelupService.new(@level).call
        if @level.save!
          render json: @level, status: :ok
        else
          render json: @level, status: :bad_request
        end
      end

      private

      def set_level
        @level = Level.find_by!(user_id: params[:id])
      end

      def level_params
        params.require(:level).permit(:user_id, :current_level, :experience, :setting_level)
      end
    end
  end
end
