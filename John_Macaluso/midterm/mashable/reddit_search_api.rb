require 'rest-client'
require 'json'
require_relative 'story'

class RedditSearchApi
  attr_reader :stories
  API_ENDPOINT = 'http://www.reddit.com/search.json'

  def search_for(query)
    parsed = JSON.parse(RestClient.get(API_ENDPOINT, {params: { q: query }}))

     @stories = parsed["data"]["children"].collect do |story|
       Story.new story["data"]["title"], story["data"]["author"], story["data"]["url"]
     end
  end

   def empty?
    stories.empty?
  end
end
