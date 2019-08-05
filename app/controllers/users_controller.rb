class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def destroy_user_session
    redirect_to new_user_session_path
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
