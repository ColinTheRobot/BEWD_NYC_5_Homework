require_relative 'mashable_api'
require_relative 'reddit_search_api'

class ProtocolPear
  attr_reader :stories
  def start
    show_intro
    ask_for_input
    get_stories
    if stories.empty?
      show_error
      start
    else
      show_stories
    end
  end

  def show_intro
    puts "Welcome to my awesome midterm"
  end

  def show_error
   puts "Sorry there are no stories related to your search"
   puts "Please try again:"
 end

 def ask_for_input
  puts "Search for something on mashable:"
end

def get_stories
  query = gets.chomp
  mashable = MashableSearchApi.new
  mashable.search_for query
  reddit = RedditSearchApi.new
  reddit.search_for query
  @stories = mashable.stories + reddit.stories
end

def show_stories
 puts "Search Results:"
 stories.each { |story| puts story }
end
end
end