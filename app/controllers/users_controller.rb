class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.upcoming_events
    @prev_events = @user.prev_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User successfully created'
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
