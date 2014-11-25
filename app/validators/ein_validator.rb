class EinValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
      require 'net/http'
      require 'uri'

      uri = URI('https://quickstartdata.guidestar.org/v1/quickstartsearch.json?q=ein:' + value)

	  Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https', :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
	  request = Net::HTTP::Get.new uri.request_uri
	  request.basic_auth ENV["GUIDESTAR_EMAIL"], ENV["GUIDESTAR_PASS"]

	  response = http.request request # Net::HTTPResponse object
	 	if response.code == "200"
		  	result = JSON.parse(response.body) #parse JSON to get EIN
			  hits = result['hits'] 
			  ein_result = hits.map {|hit| hit['ein']} #ein is in an array of the hash "hits"
		else
			  puts "Not a Valid EIN - 404 Code"
		  	  puts response.code
		  	  record.errors[:EIN] << 'Is not Valid'
		end
   end
  end
end
