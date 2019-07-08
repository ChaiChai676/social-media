class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
