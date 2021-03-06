class CreateFitbitAccounts < ActiveRecord::Migration[5.2]
  def up
    create_table :fitbit_accounts do |t|
      t.string :client_id
      t.string :client_secret
      t.string :scopes
      t.string :user_id
      t.string :token, limit: 1024
      t.string :refresh_token, limit: 1024
      t.integer :status, default: 0
      t.timestamps
    end
  end

  def down
    drop_table :fitbit_accounts
  end
end
