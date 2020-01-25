class EventsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  before_action :set_event, :except => [:index, :new]

  def index
    @events = Event.all #TODO filtration and limit a number of events
  end

  def in
    if @event.users.include? current_user
      flash.notice = 'You already visiting this event'
    else
      @event.users << current_user
      @message = 'Your request for event has been send. Creator should accept you.'
      render :'events/attendance'
    end

  end

  def out
    if @event.users.include? current_user
      @event.users.delete current_user
      @message = 'You are no longer visiting this event.'
      render :'events/attendance'
    else
      flash.notice = 'You already not visiting this event'
    end

  end

  def show
    @creator = @event.creator
  end

  def edit
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_path, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
      end
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id unless current_user.nil?
    @event.interests << Interest.find(params[:interest][0])
    respond_to do |format|
      if @event.save!
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:name, :description, :date, :duration, :interest)
  end
end