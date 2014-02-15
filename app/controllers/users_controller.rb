class UsersController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user, only: [:index, :destroy, :show]
  before_action :correct_user, only: [:edit, :update]
  layout 'user'

  def index
    @users = User.paginate(page: params[:page])
    @mainid = 'user-index'
  end

  def edit
    @mainid = 'edit-user'
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to edit_user_path, notice: 'Profile updated'
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path, notice: 'User deleted'
  end

  def dashboard
    @user = current_user
    @number_of_cars = Car.count(:all)
    @mainid = 'dashboard'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(signin_path) unless current_user?(@user)
  end
end
