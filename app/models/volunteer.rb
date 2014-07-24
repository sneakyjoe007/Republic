class Volunteer < ActiveRecord::Base
	resourcify
	belongs_to :user
	belongs_to :event
end
