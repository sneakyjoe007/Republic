class VolunteersController < ApplicationController
	before_action :set_volunteer, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

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
end
