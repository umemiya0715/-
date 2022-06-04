module Api
  module V1
    class UserSessionsController < ApplicationController
      before_action :require_login, only: :destroy

      def destroy
        logout
      end
    end
  end
end
