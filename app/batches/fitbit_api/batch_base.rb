module FitbitApi
  # バッチ既定クラス
  class BatchBase
    # 各継承先で定義しているrunメソッドの呼び出し
    def execute
      run
    rescue RestClient::Unauthorized
      # retry
      token_service.refresh_token!
      fitbit_account.reload
      run
    end

    private

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
