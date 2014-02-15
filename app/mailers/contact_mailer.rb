class ContactMailer < ActionMailer::Base
  default to: ENV['MVP_USERNAME']

  def new_message(message)
    @message = message
    mail(subject: "MVP Contact Form #{message.subject}")
  end
end
