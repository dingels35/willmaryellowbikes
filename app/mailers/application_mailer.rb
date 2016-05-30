class ApplicationMailer < ActionMailer::Base
  default from: ENV['stmp_from']
  layout 'mailer'
end
