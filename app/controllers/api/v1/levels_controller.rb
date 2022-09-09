module Api
  module V1
    class LevelsController < Api::V1::BaseController
      def show
        level = Level.find_by!(user_id: params[:id])
        render json: level
      end

      def update
        level = Level.find_by!(user_id: params[:id])
        if level.updated_at.to_date.before? Date.today
          level.experience += 1
        end
        case level.experience
        when 0 .. 2
          level.current_level = 1
        when 3 .. 6
          level.current_level = 2
        when 7 .. 13
          level.current_level = 3
        else
          level.current_level = 4
        end
        level.save!
        render json: level
      end

      private

      def level_params
        params.require(:level).permit(:user_id, :current_level, :experience, :setting_level)
      end
    end
  end
end
