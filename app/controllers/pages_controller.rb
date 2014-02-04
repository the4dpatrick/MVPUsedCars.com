class PagesController < ApplicationController


  def index
    @bodyid = 'home'
  end

  def contact
    @bodyid = 'contact'
    @subject = params[:subject]
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

end
