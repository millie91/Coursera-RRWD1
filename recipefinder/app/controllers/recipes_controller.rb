class RecipesController < ApplicationController
  def index
  	@search_term = params[:search] || 'chocolate'
  	@recipes = Recipe.for(@search_term)
  end
end
	
class Recipe
	include HTTParty

	ENV["FOOD2FORK_KEY"] = "f2905eac941284002fa65126412ca9d6"

	base_uri "http://food2fork.com/api"
	format :json
	default_params key: ENV["FOOD2FORK_KEY"]
	hostport = ENV["FOOD2FORK_SERVER_AND_PORT"] || "www.food2fork.com"
	def self.for term 
		return get("/search", query: {q: term}).parsed_response["recipes"]
	end
end