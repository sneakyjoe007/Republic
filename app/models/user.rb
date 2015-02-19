class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :name, presence: true
         
	has_attached_file :image, 
      :styles => { :original => "150x150#", :thumb => "75x75"}, 
      :default_url => "profile.gif",
      :convert_options => { :all => '-colorspace Gray' }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	has_many :events
	has_many :volunteers, foreign_key: "user_id", dependent: :destroy
end
