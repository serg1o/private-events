class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    @event.date ||= Time.now #+ 30.days
    if @event.save
      flash[:info] = "New event created."
      redirect_to root_url
    else
      render :new
    end
  end

  def index
#    @events = Event.all
    @future_events = Event.future
    @past_events = Event.past
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:description, :date)
  end
end
