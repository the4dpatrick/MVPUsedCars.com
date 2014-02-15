class ContactController < ApplicationController
  def create
    @message = Message.new(message_params)
    store_location
    if @message.valid?
      ContactMailer.new_message(@message).deliver
      redirect_back_or contact_path, notice: 'Message was sent successfully'
    else
      redirect_back_or contact_path, alert: 'Unsuccessfuly sent message'
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :phone, :body, :sweet_honey)
  end
end
