class ContactController < ApplicationController


  def create
    @message = Message.new(message_params)
    session[:return_to] = request.referer || root_path

    if @message.valid?
      ContactMailer.new_message(@message).deliver
      redirect_to session[:return_to], notice: 'Message was sent successfully'
    else
      redirect_to session[:return_to], alert: 'Unsuccessfuly sent message'
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :phone, :body, :sweet_honey)
  end

end
