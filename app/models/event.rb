class Event < ActiveRecord::Base
	resourcify
	belongs_to :organization
	belongs_to :category
	has_many :volunteers, foreign_key: "event_id", dependent: :destroy

	validates :event_date, presence: true
    validates :event_time, presence: true
    validates :name, :description, presence: true
    validates :volunteers_needed, numericality: { greater_than: 0 }
    validates :zip_code, numericality: { only_integer: true }


end
