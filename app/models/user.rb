class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :name, presence: true
         
	has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpeg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	has_many :events
	has_many :volunteers, foreign_key: "user_id"
end
