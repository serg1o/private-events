class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    @event.date ||= Time.now
    if @event.save
      flash[:info] = "New event created."
      redirect_to root_url
    else
      render :new
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:description, :date, :creator)
  end
end
