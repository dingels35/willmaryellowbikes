namespace :wyb do
  task send_daily_activity: :environment do
    ReportMailer.daily_activity.deliver_now
  end
end
