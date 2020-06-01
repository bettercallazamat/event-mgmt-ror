class EventsController < ApplicationController
  def index
    @events = Event.all
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:notice] = 'Event successfully created'
      redirect_to @event
    else
      flash[:alert] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :event_date, :description)
  end
end
