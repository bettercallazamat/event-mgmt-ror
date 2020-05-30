class AttendencesController < ApplicationController
  def create
    @event = Event.find(params[:id])
    if current_user.nil?
      flash[:error] = 'You need to login'
      redirect_to login_path
    else
      current_user.attended_events << @event
      redirect_to root_path
      flash[:success] = 'You are goint to new event'
    end
  end
end
