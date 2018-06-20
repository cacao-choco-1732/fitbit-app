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
  end
end
