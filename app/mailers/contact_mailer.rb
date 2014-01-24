class ContactMailer < ActionMailer::Base
  default to: ENV["MVP_USERNAME"]
  default from: 'no-reply@mvpusedcars.com'

  def new_message(message)
    @message = message
    mail(subject: "MVP Contact Form #{message.subject}")
  end

end
