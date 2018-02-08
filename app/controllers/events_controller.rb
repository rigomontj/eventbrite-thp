class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id
    @event.save
    redirect_to @event
  end

  def destroy
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def subscribe
    @event = Event.find(params[:id])
    unless (@event.attendees.find(current_user.id))
      @event.attendees << current_user
      flash[:success] = "Tu es bien inscrit à #{@event.name}"
    end
    redirect_to @event
  end

private
  def event_params
  params.require(:event).permit(:name, :description, :date, :place, :duration)
  end

end
