module Api
  module V1
    class UserSessionsController < Api::V1::BaseController
      before_action :require_login, only: :destroy

      def destroy
        logout
      end
    end
  end
end
