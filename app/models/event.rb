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

 #   scope :category_id, -> (category_id) {where category_id: category_id}
 #   scope :search, -> (query) { where("name like ?", "#{query}%")}
#<li><%= f.association :category, as: :check_boxes, label: '', input_html: { class: 'checkbox' } %></li>

    def self.search(query)
  		where("name like ?", "%#{query}%") 
	end

	def self.select(category)
		#value = category[1].split(/\s/).map(&:to_i)
		where("category_id like ?", "%#{category}%")
	end
end
