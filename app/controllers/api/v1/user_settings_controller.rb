module Api
  module V1
    class UserSettingsController < ApplicationController
      before_action :require_login, only: [:update, :destroy]

      def update
      end

      def destroy
        current_user.destroy!
      end
    end
  end
end
