class EventsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  before_action :set_event, :except => [:index, :new, :create]


  def index
    @events = Event.approved.order(:date) #TODO filtration and limit a number of events
  end

  def in
    if @event.users.include? current_user
      flash.notice = 'You already visiting this event'
    else
      Attendance.create! attendance_params
      @message = 'Your request for event has been send. Creator should accept you.'
      render :'events/attendance'
    end

  end

  def out
    if @event.users.include? current_user
      Attendance.destroy_by user_id: current_user.id, event_id: @event.id
      @message = 'You are no longer visiting this event.'
      render :'events/attendance'
    else
      flash.notice = 'You already not visiting this event'
    end
  end

  def apply
    Attendance.find_by(user_id: params[:user_id], event_id: @event.id).update_attribute :confirmation, true
    show
  end

  def reject
    Attendance.destroy_by user_id: params[:user_id], event_id: @event.id
    show
  end

  def show
    @creator = @event.creator
  end


  def edit
  end

  def update
    respond_to do |format|
      if @event.update(event_params) && Interest.add_interests( @event, params[:interest] )
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
    Interest.add_interests(@event, params[:interest])
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
    params.require(:event).permit(:name, :description, :date, :duration, :interest => [])
  end

  def attendance_params
    {:user_id => current_user.id, :event_id => @event.id, :confirmation => false,
     :requested_at => Time.now }
  end


end