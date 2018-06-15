module FitbitApi
  module Responses
    # リフレッシュトークン
    class RefreshToken
      include Virtus.value_object

      values do
        attribute :access_token, String
        attribute :expires_in, Integer
        attribute :refresh_token, String
        attribute :scope, String
        attribute :token_type, String
        attribute :user_id, String
      end
    end
  end
end
