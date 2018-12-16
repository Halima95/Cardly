class EventsController < ApplicationController
  before_action :authenticate_user!, onliy: [:new, :create, :edit, :update, :delete]
  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new 
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.save 
    redirect_to @event
    end
  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    event = Event.find_by(id: params[:id])
    event.update(event_params)
    redirect_to event_path(event) # -> Show method
    # redirect_to authors_path # -> Index method
  end

  def destroy
     @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end 
  private
   def event_params
    params.require(:event).permit(:title, :location, :date, :description, :user_id)
  end 
end
