class Api::V1::SkyscannerController < ApplicationController
	def claim_lists
		@air_ports = FlightSearch.places
	end
	def claim_lists_results
		unless params[:from].blank? and params[:to].blank? and params[:outdate].blank?
			parameters = params
			@json = FlightSearch.search(parameters)
		end
	end

end