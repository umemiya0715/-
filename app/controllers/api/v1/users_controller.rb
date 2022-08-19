module Api
  module V1
    class UsersController < Api::V1::BaseController
      def show
        user = User.find_by!(twitter_id: params[:twitter_id])
        render json: user
      end

      def me
        render json: current_user
      end
    end
  end
end
