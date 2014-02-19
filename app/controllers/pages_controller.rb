class PagesController < ApplicationController
  before_action :set_message

  def index
    @body_id = 'home'
    @reviews = Review.limit(6)
  end

  def contact
    @body_id = 'contact'
    @subject = params[:subject]
  end

  def about
    @body_id = 'about'
  end

  def location
    @body_id = 'location'
  end

  def faq
    @body_id = 'faq'
  end
end
