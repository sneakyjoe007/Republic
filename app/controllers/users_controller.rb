class UsersController < ApplicationController
	before_action :authenticate_user!

	def profile
		@volunteers = Volunteer.all.where(user_id: current_user.id).order("created_at ASC")
	end

end