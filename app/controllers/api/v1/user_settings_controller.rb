module Api
  module V1
    class UserSettingsController < Api::V1::BaseController
      before_action :require_login, only: [:update, :destroy]

      def update
        data = client.user(current_user.screen_name)
        current_user.update!(name: data[:name], screen_name: data[:screen_name], twitter_id: data[:id], image: data[:profile_image_url_https])
        render json: current_user, status: :ok
      end

      def destroy
        current_user.destroy!
      end
    end
  end
end
