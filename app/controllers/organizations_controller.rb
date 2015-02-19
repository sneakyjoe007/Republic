class OrganizationsController < ApplicationController

	def profile
		@events = Event.all.where(organization_id: current_organization.id).order("created_at ASC")
		@organization = Organization.where(id: current_organization.id).first
	end

	def volunteers
		@events = Event.all.where(organization_id: current_organization.id).order("created_at ASC")
	end


end
