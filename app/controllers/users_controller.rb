class UsersController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user, only: [:index, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :show]
  layout "user"

  def index
    @users = User.paginate(page: params[:page])
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user, notice: "Profile updated"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path, notice: "User deleted"
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
