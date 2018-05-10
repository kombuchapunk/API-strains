class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end

class NotifierMailer < ApplicationMailer
  default from: 'no-reply@example.com',
          return_path: 'system@example.com'

  def welcome(authkey, name, email)
    @authkey = authkey
    @name = name
    @email = email
    mail(to: email )
  end
end
