module FitbitApi
  # アクセストークン
  class AccessToken
    # 初期化
    #
    # @param [FitbitAccount] fitbit_account 連携アカウント
    def initialize(fitbit_account)
      @fitbit_account = fitbit_account
    end

    # リフレッシュトークンを用いて、トークンを更新する
    def refresh_token
      headers = {
        'Content-Type' => 'application/x-www-form-urlencoded',
        Authorization: "Basic #{basic_authorization}"
      }

      params = {
        grant_type: 'refresh_token',
        refresh_token: fitbit_account.refresh_token
      }

      refresh_token_response = client.post(Settings.fitbit.token_endpoint, params, headers)
      refresh_token_value = FitbitApi::RefreshToken.new(JSON.parse(refresh_token_response.body))

      fitbit_account.token = refresh_token_value.access_token
      fitbit_account.refresh_token = refresh_token_value.refresh_token
      fitbit_account.save
    end

    private

    attr_reader :fitbit_account

    # APIクライアント
    #
    # @return [FitbitApi::Client] APIクライアントインスタンス
    def client
      @client ||= Client.new(fitbit_account)
    end

    # Basic認証
    #
    # @return [String] base64エンコード結果
    def basic_authorization
      Base64.encode64("#{fitbit_account.client_id}:#{fitbit_account.client_secret}")
    end
  end
end
