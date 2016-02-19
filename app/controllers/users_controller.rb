class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:provider, :uid)
  end
end