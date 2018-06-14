require 'rest-client'

module FitbitApi
  # fitbit API連携クライアント
  class Client
    # @param [FitbitAccount] fitbit_account 連携アカウント
    def initialize(fitbit_account)
      @endpoint = 'https://api.fitbit.com/1.2/user'
      @fitbit_account = fitbit_account
    end

    def user
      RestClient.get "#{endpoint}/#{fitbit_account.user_id}/profile.json", { Authorization: "Bearer #{fitbit_account.token}" }
    end

    private

    attr_reader :endpoint, :fitbit_account

    def authorization
      { Authorization: "Bearer #{fitbit_account.token}" }
    end
  end
end
