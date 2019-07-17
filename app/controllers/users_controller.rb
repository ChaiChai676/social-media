class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
