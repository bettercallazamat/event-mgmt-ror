class EventsController < ApplicationController
  def index
    @events = Event.all
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
      flash[:success] = 'Object successfully created'
      redirect_to @event
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :event_date, :description)
  end
end
