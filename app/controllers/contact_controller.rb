class ContactController < ApplicationController

  def create
    @message = Message.new(message_params)

    if @message.valid?
      ContactMailer.new_message(@message).deliver
      # success module
      redirect_to(root_path, notice: 'Message was sent successfully.')
    else
      # highlight which fields are not valid
      flash[:alert] = 'Please fill in all the field'
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :phone, :body, :sweet_honey)
  end
end
