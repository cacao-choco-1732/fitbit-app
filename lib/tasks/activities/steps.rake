namespace :activities do
  namespace :steps do
    desc 'test'
    task :update, [:date] => :environment do |task, args|
      date = args.fetch(:date, Time.current.strftime('%Y-%m-%d'))
      FitbitApi::Activities::WeeklyStepRegister.new(date).execute
    end
  end
end
