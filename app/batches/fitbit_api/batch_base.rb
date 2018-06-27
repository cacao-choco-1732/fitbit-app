module FitbitApi
  # バッチ既定クラス
  class BatchBase
    # 各継承先で定義しているrunメソッドの呼び出し
    def execute
      retry_count = 0
      success = false

      while !success
        begin
          run
          success = true
        rescue RestClient::Unauthorized => ex
          raise ex if MAX_RETRY_COUNT < retry_count

          # retry
          token_service.refresh_token!
          fitbit_account.reload
          retry_count += 1
        end
      end
    end

    private

    MAX_RETRY_COUNT = 2
    private_constant(:MAX_RETRY_COUNT)

    # 連携アカウント
    #
    # @return [FitbitAccount] FitbitAccountインスタンス
    def fitbit_account
      @fitbit_account ||= FitbitAccount.active_account
    end

    # APIクライアント
    #
    # @return [FitbitApi::Client] APIクライアントインスタンス
    def client
      @client ||= Client.new(fitbit_account)
    end

    # アクセストークンサービス
    #
    # @return [FitbitApi::AccessToken] アクセストークンサービスインスタンス
    def token_service
      @access_token_service ||= AccessToken.new
    end
  end
end
