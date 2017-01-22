class Recipe
  
  	key_value = ENV['FOOD2FORK_KEY']
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'food2fork.com'
  	base_uri "http://#{hostport}/api"
  	default_params key: "f2905eac941284002fa65126412ca9d6"
  	format :json

  	def self.for (keyword)
   		get("/search", query: {q: keyword})["recipes"]
  	end
end