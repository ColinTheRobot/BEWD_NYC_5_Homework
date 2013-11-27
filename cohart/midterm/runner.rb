require 'rubygems'
require 'json'
require 'twitter'
require 'pry'

require_relative 'geocode_address.rb'
require_relative 'prompt.rb'

client = Twitter.configure do |config| 
        config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
        config.oauth_token = ENV["OAUTH_TOKEN"]
        config.oauth_token_secret = ENV["OAUTH_SECRET"]
end

prompt = Prompt.new
# sets topic, radius, and address
prompt.start
# set lat and long
prompt.coordinize

result = client.search("#{prompt.topic}", {geocode:"#{prompt.lat},#{prompt.long},#{prompt.radius}"}).statuses
result.each{|r| puts r.full_text}

if result.empty?
  puts "We're sorry. There are no stories about #{prompt.topic} near your location."
end
