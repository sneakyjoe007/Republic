class Organization < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, dependent: :destroy

  validates_presence_of :name, :EIN
  validates :EIN, ein: true

  
	has_attached_file :image, 
		:styles => { :original => "150x150#" }, 
		:default_url => "default.jpeg", 
		:convert_options => { :all => '-colorspace Gray' }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


end
