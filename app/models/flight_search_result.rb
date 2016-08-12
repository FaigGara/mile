class FlightSearchResult < ActiveRecord::Base
	belongs_to :flight_search


	def self.flight_agent( json )

		agents = {}
			json["Agents"].each { |agent| 
				#if agent["Type"] == "Airline" then
					agents[agent["Id"]] = agent["Name"]
				#end
			}

			#puts agents.inspect
			return agents

	end

	def self.flight_result( json )
			results = []
			agents = FlightSearchResult.flight_agent(json)
			json["Itineraries"].each { |i|

				# i["PricingOptions"].each { |price| 
				# 	flight = {}
				# 	if agents[price["Agents"].first] then
				# 		flight[:agent] = agents[price["Agents"].first]
				# 		flight[:price] = price["Price"]
				# 		@results << flight
				# 	end 
				# }

				
				flight = {}
				price = i["PricingOptions"].first
				flight[:agent] = agents[price["Agents"].first]
				flight[:price] = price["Price"]
				results << flight
			}
			return results

	end

	def self.json_result_parse(json)
	
		result={}
		agents = FlightSearchResult.flight_agent(json)
		results = FlightSearchResult.flight_result(json)

			json.each do |j|
				result[:from_place] = j['Places']["Name"]
				result[:from_place_code] = j['Places'][0]["Code"]

				result[:to_place] = j['Places'][1]["Name"]
				result[:to_place_code] = j['Places'][1]["Code"]

				result[:airline_name] = j["Carriers"][0]["Name"]
				result[:airline_code] = j["Carriers"][0]["Code"]

				result[:departure_time] = j["Legs"][0]["Departure"]
				result[:arrival_time] = j["Legs"][0]["Arrival"] 
				result[:agent] = j["Agents"][0]["Name"]
				result[:price] = results[0][:price]
				result[:price_code] = j['Currencies'][0]["Code"]
			end
		return result
	end
end