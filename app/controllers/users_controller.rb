class UsersController < ApplicationController
  def profile
    @user = current_user
    authorize @user
  end

  def article_params
    params.require(:user).permit(:last_name, :first_name, :photo)
  end
end
