class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      flash[:success] = "User successfully logged in"
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
      redirect_to sessions_login
    end
  end

  def login
  end

  def destroy
    flash[:success] = "You logged out"
    session.delete(:user_id)
  end
  
end
