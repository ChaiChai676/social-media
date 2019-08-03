class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
