HtmlEntities.new.decode("Kahl&uacute;a-Spiked") # "Kahlúa-Spiked"

class Recipe
    include HTTParty
    key_value = ENV['FOOD2FORK_KEY']
    host = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
    base_uri "http://food2fork.com/api/search"
    default_params :key => ENV["FOOD2FORK_KEY"] || 'f2905eac941284002fa65126412ca9d6'
    format :json
    
    def self.for term
        get("", query: {q: term})["recipes"]
    end
end
