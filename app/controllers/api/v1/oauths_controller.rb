module Api
  module V1
    class OauthsController < Api::V1::BaseController
      def oauth
        login_at(auth_params[:provider])
      end

      def callback
        provider = auth_params[:provider]
        if auth_params[:denied].present?
          redirect_to root_path
          return
        end
        if (user = login_from(provider))
          user.authentication.update!(
            access_token: access_token.token,
            access_token_secret: access_token.secret
          )
        else
          fetch_user_data_from(provider)
        end
        redirect_to root_path
      end

      private

      def auth_params
        params.permit(:code, :provider, :denied, :format, :oauth_token, :oauth_verifier)
      end

      def fetch_user_data_from(provider)
        user_from_provider = build_from(provider)
        user = User.find_or_initialize_by(twitter_id: user_from_provider.twitter_id)
        user = user_from_provider if user.new_record?
        user.build_authentication(uid: @user_hash[:uid],
                                  provider: provider,
                                  access_token: access_token.token,
                                  access_token_secret: access_token.secret)
        user.save!
        reset_session
        auto_login(@user)
      end
    end
  end
end
