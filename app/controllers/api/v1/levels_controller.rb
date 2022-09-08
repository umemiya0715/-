module Api
  module V1
    class LevelsController < Api::V1::BaseController
      def show
        level = Level.find_by!(user_id: params[:id])
        render json: level
      end

      def update
        level = Level.find_by!(user_id: params[:id])
        if level.updated_at.time.before? Time.zone.now
          level.experience += 1
        end
        criteria = [3, 7, 14]
        if level.experience >= criteria[level.current_level - 1]
          level.current_level += 1
        end
        level.update!
        render json: level
      end

      private

      def level_params
        params.require(:level).permit(:user_id, :current_level, :experience, :setting_level)
      end
    end
  end
end
