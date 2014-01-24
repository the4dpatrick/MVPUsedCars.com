class PagesController < ApplicationController
  before_action :set_message

  def index
  end

  def inventory
  end

  def contact
  end

  def about
  end

  def location
  end

  def faq
  end

  private

  def set_message
    @message = Message.new
  end

end
