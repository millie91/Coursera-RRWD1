require 'httparty'
require 'pp'

class Recipe
	include HTTParty


	default_options.update(verify: false) # Turn off SSL verification
  
  	key_value = ENV['FOOD2FORK_KEY'] || "f2905eac941284002fa65126412ca9d6"
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'food2fork.com'
  	base_uri "http://#{hostport}/api"
  	default_params key: key_value
  	format :json

  	def self.for (keyword)
   		get("/search", query: {q: keyword})["recipes"]
  	end
end