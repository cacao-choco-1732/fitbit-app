module Reports
  # 歩数コントローラー
  class ActivityStepsController < ApplicationController
    def index
      steps = FitbitAccount.active_account.activity_steps.order(tracking_date: :asc)
      @chart_labels = steps.map(&:tracking_date)
      @chart_data = steps.map(&:step)
    end
  end
end
