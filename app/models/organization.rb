class Organization < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  
	has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpeg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
	has_many :events, dependent: :destroy

	def search_ein()
		require 'net/http' 
		uri = URI('https://quickstartdata.guidestar.org/v1/quickstartsearch?q=ein:54-1774039')

		Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https', :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http| 
		  request = Net::HTTP::Get.new uri.request_uri
		  request.basic_auth 'alex.stanga@me.com', 'Ponytone1019' 
		  response = http.request request # Net::HTTPResponse object 
		  puts response.body 
		end 
	end
end
