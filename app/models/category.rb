class Category < ActiveRecord::Base
	has_many :events, foreign_key: "category"
end
