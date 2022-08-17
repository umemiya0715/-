module Api
  module V1
    class ResultsController < Api::V1::BaseController
      def previous_results
        @results = Result.includes(:dragon).where(user_id: params[:id]).order(created_at: :desc)
        render json: @results, include: [:dragon], status: :ok
      end

      def last_result
        @results = Result.includes(:dragon).where(screen_name: params[:id]).order(created_at: :desc).limit(2)
        # user_idだとログインユーザー以外を対象にした診断結果も検索対象となるため、screen_nameで絞り込み
        render json: @results, include: [:dragon], status: :ok
      end

      def show
        @result = Result.find(params[:id])
        render json: @result, include: [:dragon], status: :ok
      end

      def create
        target_id = result_params['target_account']
        target = client.user(target_id)
        tweets = client.user_timeline(target, count: 16, exclude_replies: true, include_rts: false)
        user = result_params['user_id']
        analyzed_result = AnalyzeAccountService.new(target, tweets, user).call
        @result = Result.new(analyzed_result)
        if @result.user_id.zero?
          render json: @result, status: :ok
        elsif @result.save
          render json: @result, status: :created
        else
          render json: @result, status: :bad_request
        end
      end

      private

      def result_params
        params.require(:result).permit(:user_id, :dragon_id, :score, :magnitude, :troversion,
                                       :target_account, :screen_name)
      end
    end
  end
end
