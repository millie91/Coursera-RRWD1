require 'httparty'

class Recipe 
  include HTTParty
  
  format :json

  key_value = ENV["FOOD2FORK_KEY"]
  default_params key: ENV["FOOD2FORK_KEY"]
  hostport = ENV["FOOD2FORK_SERVER_AND_PORT"] || "www.food2fork.com"
  base_uri "http://#{hostport}/api"

  def self.for (keyword)
    get("/search", query: {q: keyword})["recipes"]
  end
end