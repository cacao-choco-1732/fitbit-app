module FitbitApi
  module Activities
    # 1週間分の歩数を取得して登録する
    class WeeklyStepRegister < BatchBase
      # 初期化
      #
      # @param [String] date 取得基準日
      def initialize(date)
        @date = date
      end

      # メイン処理
      def run
        body = JSON.parse(weekly_steps.body)
        body['activities-steps'].each do |step|
          activity_step = ActivityStep.find_or_initialize_by(
            fitbit_account_id: fitbit_account.id,
            tracking_date: step['dateTime']
          )
          activity_step.step = step['value']
          activity_step.save
        end
      end

      private

      attr_reader :date

      # 1週間分のデータ取得
      #
      # @return [Array<Hash>] [{"dateTime" => "2018-06-09", "value" => "10918"},...]
      def weekly_steps
        # {
        #   "activities-steps":[
        #     {"dateTime":"2018-06-07","value":"10164"},
        #     {"dateTime":"2018-06-08","value":"13263"},
        #     {"dateTime":"2018-06-09","value":"10918"},
        #     {"dateTime":"2018-06-10","value":"505"},
        #     {"dateTime":"2018-06-11","value":"10319"},
        #     {"dateTime":"2018-06-12","value":"12129"},
        #     {"dateTime":"2018-06-13","value":"14611"}
        #   ]
        # }
        client.get("activities/steps/date/#{date}/1w.json")
      end
    end
  end
end
