class SessionsController < ApplicationController

  def new
    @body_id = 'signin'
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user] = user.id
      sign_in user
      # redirect_back_or() accepts two arguments
      # default path and options
      # see SessionsHelper.rb
      redirect_back_or dashboard_path, {}
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end
