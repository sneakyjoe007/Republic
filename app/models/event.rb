class Event < ActiveRecord::Base
	
	belongs_to :organization
	has_many :volunteers, foreign_key: "event_id"
end
