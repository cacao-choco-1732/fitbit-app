require 'rest-client'

module FitbitApi
  # fitbit API連携クライアント
  class Client
    # 初期化
    #
    # @param [FitbitAccount] fitbit_account 連携アカウント
    def initialize(fitbit_account)
      @endpoint = Settings.fitbit.endpoint
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

      refresh_token_response = post(Settings.fitbit.token_endpoint, params, headers)
      refresh_token_value = FitbitApi::RefreshToken.new(JSON.parse(refresh_token_response.body))

      fitbit_account.token = refresh_token_value.access_token
      fitbit_account.refresh_token = refresh_token_value.refresh_token
      fitbit_account.save
    end

    # GET
    #
    # @param [String] resource_url 取得先リソース
    def get(resource_url)
      RestClient.get("#{endpoint}/#{fitbit_account.user_id}/#{resource_url}", authorization)
    end

    # POST
    #
    # @param [String] url APIのurl
    # @param [Hash] params body要素
    # @param [Hash] headers ヘッダ情報
    def post(url, params, headers)
      RestClient.post(url, params, headers)
    end

    delegate :id, to: :fitbit_account, prefix: true

    private

    attr_reader :endpoint, :fitbit_account

    # Authorization
    #
    # @return [Hash] アクセストークン情報
    def authorization
      { Authorization: "Bearer #{fitbit_account.token}" }
    end

    # Basic認証
    #
    # @return [String] base64エンコード結果
    def basic_authorization
      Base64.encode64("#{fitbit_account.client_id}:#{fitbit_account.client_secret}")
    end
  end
end
