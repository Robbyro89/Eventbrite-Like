class EventsController < ApplicationController

  def index
    @event = Event.all
  end

  def new
    if logged_in?
      @event = Event.new
    else
      redirect_to login_path
    end
  end

  def create
    @user = current_user
    @event = @user.authored_events.new(event_params)
    if @event.save
      flash[:success] = "Evénement enregistré"
    end
  end

  def show
    @event = Event.find(params[:id])
    @users = User.all
  end

  def attend
    @event = Event.find(params[:id])
    @event.user_attendees << current_user
    @event.save
    flash[:success] = "Vous êtes bien inscrit à l'événement !"
    redirect_to events_path
  end

  def invite
    @event = Event.find(params[:id])
    @user = User.find(params[:user])
    @event.user_attendees << @user
    @event.save
    flash[:success] = "Un ami a été ajouté sur l'événement !"
    redirect_to @event
  end

  def unattend
    @event = Event.find(params[:id])
    @event.user_attendees.delete(current_user)
    @event.save
    flash[:success] = "Vous vous êtes désinscrit !"
    redirect_to current_user
  end

  def destroy
    @user = current_user
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "Évenement supprimé !"
    redirect_to @current_user
  end

private
  def params_event
    params.permit(:description, :date, :place, :creator_id)
  end

end
