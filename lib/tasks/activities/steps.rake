namespace :activities do
  namespace :steps do
    desc '直近1週間の歩数を取得して登録する'
    task :update, [:date] => :environment do |task, args|
      date = args.fetch(:date, Time.current.strftime('%Y-%m-%d'))
      FitbitApi::Activities::WeeklyStepRegister.new(date).execute
    end
  end
end
