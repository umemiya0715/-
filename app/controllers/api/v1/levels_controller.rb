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
        if @level.updated_at.to_date.before? Date.today
          @level.experience += 1
        end
        former_level = @level.current_level
        case @level.experience
        when 0 .. 2
          @level.current_level = 1
        when 3 .. 6
          @level.current_level = 2
        when 7 .. 13
          @level.current_level = 3
        else
          @level.current_level = 4
        end
        if former_level != @level.current_level
          @level.setting_level = @level.current_level
        end
        @level.save!
        render json: @level
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
