class AccountsController < ApplicationController
  def index
    FitbitAccount.all
  end

  def new
    @fitbit_account = FitbitAccount.new
  end

  def create
    @fitbit_account = FitbitAccount.new(required_params)
    if @fitbit_account.invalid?
      render :new
      return
    end

    @fitbit_account.save!
    redirect_to accounts_path
  end

  private

  def required_params
    params.require(:fitbit_account).permit(
      :client_id, :client_secret, :scopes, :user_id, :token, :refresh_token)
  end
end
