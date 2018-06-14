# fitbit 連携アカウント
class FitbitAccount < ApplicationRecord
  validates :client_id, presence: true
  validates :client_secret, presence: true
  validates :scopes, presence: true
  validates :user_id, presence: true
  validates :token, presence: true
end
