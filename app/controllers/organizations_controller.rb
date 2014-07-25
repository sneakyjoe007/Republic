class OrganizationsController < ApplicationController
	before_action :authenticate_organization!

	def profile
		@events = Event.all.where(organization_id: current_organization.id).order("created_at ASC")
	end

end