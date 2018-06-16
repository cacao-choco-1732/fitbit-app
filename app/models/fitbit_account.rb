# fitbit 連携アカウント
class FitbitAccount < ApplicationRecord
  has_many :activity_steps, dependent: :destroy

  validates :client_id, presence: true
  validates :client_secret, presence: true
  validates :scopes, presence: true
  validates :user_id, presence: true
  validates :token, presence: true

  enum status: { active: 1, inactive: 0 }

  def self.active_account
    active.first
  end
end
