class VolunteersController < ApplicationController
	before_action :set_volunteer, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	before_action :record_volunteer_signup

	def index
		@volunteers = Volunteer.all.order("created_at DESC")
	end

  	def new
  		@volunteer = Volunteer.new
  		@event = Event.find(params[:event_id])
  	end

  	def create
	  	@volunteer = Volunteer.new
	  	@event = Event.find(params[:event_id])

	  	@volunteer.event_id = @event.id
	  	@volunteer.user_id = current_user.id

	  	@event.volunteers_current = @event.volunteers.count + 1
	    @event.volunteers_percentage = @event.volunteers_current.to_d / @event.volunteers_needed * 100

	    @event.update(:volunteers_current => @event.volunteers_current, :volunteers_percentage => @event.volunteers_percentage)


	  	respond_to do |format|
	      if @volunteer.save
	        format.html { redirect_to root_url, notice: 'Joined Successfully' }
	        format.json { render :show, status: :created, location: @volunteer }
	      else
	        format.html { render :new }
	        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
	      end
	    end

  	end

  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer
      @volunteer = Volunteer.find(params[:id])
    end

    def record_volunteer_signup
      @event = Event.find(params[:event_id])

      @event.volunteers.each do |event|
      	if event.user_id == current_user.id
      		flash[:alert] = "Already Joined Event"
      		redirect_to event_url(params[:event_id])
      	end
      end
    end
end
