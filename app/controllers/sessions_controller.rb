class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      flash[:notice] = 'User successfully logged in'
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:alert] = 'Something went wrong'
      redirect_to sessions_login
    end
  end

  def destroy
    flash[:notice] = 'You logged out'
    session[:user_id] = nil
    redirect_to root_path
  end
end
