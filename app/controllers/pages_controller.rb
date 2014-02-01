class PagesController < ApplicationController


  def index
    @bodyid = 'home'
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

end
