class SessionsController < ApplicationController
  def create
    puts "entering create action"
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
    puts "leaving create action"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
