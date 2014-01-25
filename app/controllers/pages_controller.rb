class PagesController < ApplicationController
  before_action :set_message

  def index
    @bodyid = 'home'
  end

  def inventory
    @bodyid = 'inventory'
  end

  def contact
    @bodyid = 'contact'
  end

  def about
    @bodyid = 'about'
  end

  def location
    @bodyid = 'location'
  end

  def faq
    @bodyid = 'faq'
  end

  private

  def set_message
    @message = Message.new
  end

end
