class FlightSearch < ActiveRecord::Base
	has_many :flight_search_result

	def self.places
		url = URI("http://partners.api.skyscanner.net/apiservices/autosuggest/v1.0/TR/TRY/tr-TR?query=Turkey&apiKey=prtl6749387986743898559646983194")

		http = Net::HTTP.new(url.host, url.port)

		request = Net::HTTP::Get.new(url)
		request["cache-control"] = 'no-cache'
		request["postman-token"] = '6d994b55-06a3-a323-3721-045e2b2966fb'
		request["content-type"] = 'application/x-www-form-urlencoded'
		

			
		response = http.request(request)
		

		body = response.read_body
		json = JSON.parse(body)
		return json
	end


	def self.search( parameters = {})
		from	= parameters[:from]
		to		= parameters[:to]
		outdate	= parameters[:outdate]

		url = URI("http://partners.api.skyscanner.net/apiservices/pricing/uk2/v1.0")

		http = Net::HTTP.new(url.host, url.port)

		request = Net::HTTP::Post.new(url)
		request["cache-control"] = 'no-cache'
		request["postman-token"] = '6d994b55-06a3-a323-3721-045e2b2966fb'
		request["content-type"] = 'application/x-www-form-urlencoded'
		request.body = "apiKey=gl978889663711799940744729476945&country=TR&currency=TRY&locale=TR&originplace=#{from}-sky&destinationplace=#{to}-sky&outbounddate=#{outdate}&adults=1"

		response = http.request(request)
		response_url = response["location"] + "?apiKey=gl978889663711799940744729476945&stops=0"
		Rails.logger.info response_url

		url = URI(response_url)

		http = Net::HTTP.new(url.host, url.port)

		request = Net::HTTP::Get.new(url)
		request["cache-control"] = 'no-cache'

		body = response.read_body
		json = JSON.parse(body)	
		
		return json

	end

end
