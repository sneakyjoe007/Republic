class Category < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "missing.png"
	
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	has_many :events, foreign_key: "category_id"
end
