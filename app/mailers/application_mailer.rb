class ApplicationMailer < ActionMailer::Base
  default from: 'notifications-no-reply@ruby-notes.heroku.com'
  layout 'mailer'
end
