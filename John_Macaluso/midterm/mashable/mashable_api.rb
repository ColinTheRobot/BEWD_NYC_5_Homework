require 'rest-client'
require 'json'
require_relative 'story'

class MashableSearchApi
  attr_reader :stories
  API_ENDPOINT = "http://mashable.com/search.json"

  def search_for(query)
    parsed = JSON.parse(RestClient.get(API_ENDPOINT, {params: { q: query }}))

    @stories = parsed["posts"].collect do |story|
       Story.new story["title"], story["author"], story["content"]["plain"]
     end
   end

   def empty?
    stories.empty?
  end
end