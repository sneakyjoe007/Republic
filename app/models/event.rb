class Event < ActiveRecord::Base
	resourcify
	belongs_to :organization
	has_many :volunteers, foreign_key: "event_id", dependent: :destroy

	validates :event_date, presence: true
    validates :event_time, presence: true


end
