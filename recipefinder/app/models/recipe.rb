class Recipe
	include HTTParty

	ENV["FOOD2FORK_KEY"] = "f2905eac941284002fa65126412ca9d6"

	hostport = ENV["FOOD2FORK_SERVER_AND_PORT"] || "www.food2fork.com"
	base_uri "http://#{hostport}/api"

	default_params key: ENV["FOOD2FORK_KEY"]
	format :json
	
	def self.for term 
		return get("/search", query: {q: term}).parsed_response["recipes"]
	end
end