class AccountsController < ApplicationController
  def index
    FitbitAccount.all
  end
end
