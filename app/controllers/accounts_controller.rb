class AccountsController < ApplicationController
  def index
    @fitbit_accounts = FitbitAccount.all
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

  def destroy
    fitbit_account = FitbitAccount.find(params[:id])
    raise if fitbit_account.active?
    fitbit_account.destroy!
    redirect_to accounts_path
  end

  def activate
    ApplicationRecord.transaction do
      FitbitAccount.active.first.try(:inactive!)
      fitbit_account = FitbitAccount.find(params[:id])
      fitbit_account.active!
    end

    redirect_to accounts_path
  end

  private

  def required_params
    params.require(:fitbit_account).permit(
      :client_id, :client_secret, :scopes, :user_id, :token, :refresh_token)
  end
end
