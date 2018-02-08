class EventsController < ApplicationController

  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.description = params_event[:description]
    @event.date = params_event[:date]
    @event.place = params[:place]
    @event.creator = User.find(params_event[:creator_id])
    @event.save
      if @event.save
        redirect_to events_path
      else
        render 'new'
      end
  end

  def show
    @event = Event.find(params[:id])
  end

private
  def params_event
    params.permit(:description, :date, :place, :creator_id)
  end

end
