class ReportMailer < ApplicationMailer

  def daily_activity
    @statuses = Status.includes(:bike_rack).where('created_at > ?', 3.days.ago).order(created_at: :desc)
    mail(to: ENV['daily_activity_recipients'], subject: "Daily status report for #{Time.now.in_time_zone('US/Central').strftime('%a %b %e')}")
  end

end
