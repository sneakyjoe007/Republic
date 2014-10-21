class OrganizationsController < ApplicationController

	def profile
		@events = Event.all.where(organization_id: current_organization.id).order("created_at ASC")
	end


	def guideStar
		require 'net/http'
		ein = params[:EIN]
		

		uri = URI('https://quickstartdata.guidestar.org/v1/quickstartsearch?q=ein:' + ein)

		Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https', :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
		  request = Net::HTTP::Get.new uri.request_uri
		  request.basic_auth ENV["GUIDESTAR_EMAIL"], ENV["GUIDESTAR_PASS"]

		  response = http.request request # Net::HTTPResponse object

		  puts response.body
		end
		render :nothing => true
	end

end
