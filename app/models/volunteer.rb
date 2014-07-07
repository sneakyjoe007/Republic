class Volunteer < ActiveRecord::Base
	belongs_to :user
	belongs_to :event, dependent: :destroy
end
