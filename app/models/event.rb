class Event < ActiveRecord::Base
	include IceCube

	resourcify
	belongs_to :organization
	belongs_to :category
	has_many :volunteers, foreign_key: "event_id", dependent: :destroy

	validates :start_date, presence: true
    validates :event_time, presence: true
    validates :name, :description, presence: true
    validates :volunteers_needed, numericality: { greater_than: 0 }
    validates :zip_code, numericality: { only_integer: true }
    
    def self.search(query)
  		where("name like ?", "%#{query}%") 
	end

	def self.select(category)
		#value = category[1].split(/\s/).map(&:to_i)
		where("category_id like ?", "%#{category}%")
	end
end
