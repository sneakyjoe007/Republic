class Organization < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :EIN
  validates :EIN, ein: true

  
	has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpeg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
	has_many :events, dependent: :destroy


end
