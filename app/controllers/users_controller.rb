class UsersController < ApplicationController
	before_action :authenticate_user!

	def profile
		@categories = Category.all
		@events = Event.all.where("event_date >= ?", Date.today)
		@user = User.where(id: current_user.id).first
	end

	def events
		@volunteers = Volunteer.all.where(user_id: current_user.id).order("created_at ASC")
	end

	def search
		@events = Event.all.where("event_date = ?", params[:event_date])
		render layout: false
	end

	def show
		@user = User.find(params[:user_id])
	end


end

