module Api
  module V1
    class UsersController < ApplicationController
      before_action :require_login, only: :destroy

      def show
        user = User.find_by(twitter_id: params[:twitter_id])
        render json: user
      end

      def me
        render json: current_user
      end

      def edit; end

      def update; end

      def destroy
        user = User.find(params[:twiiter_id])
        render json: user
      end
    end
  end
end
