module Api
  module V1
    class OauthsController < ApplicationController
      def oauth
        login_at(auth_params[:provider])
      end

      def callback
        provider = auth_params[:provider]
        if auth_params[:denied].present?
          redirect_to root_path, notice: 'ログインをキャンセルしました。'
          return
        end
        if (@user = login_from(provider))
          redirect_to me_home_path, notice: "#{provider.titleize}ログインしました。"
        else
          begin
            @user = create_from(provider)
            reset_session
            auto_login(@user)
            redirect_to me_home_path, notice: "#{provider.titleize}ログインしました。"
          rescue StandardError
            redirect_to root_path, alert: "#{provider.titleize}ログインに失敗しました。"
          end
        end
      end

      private

      def auth_params
        params.permit(:code, :provider, :denied)
      end
    end
  end
end
