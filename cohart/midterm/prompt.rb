require 'geocoder'

class Prompt
  attr_accessor :topic, :radius, :address, :lat, :long

  def initialize
  end

  def start
    puts "Welcome to TweetLocal search feature."
    #collect user input
    puts "What would you like to search for?"
    @topic = gets.chomp
    puts "That's a great topic. We love #{topic}. Now for your location, at which address would you like to center your search? (format: street address, city, state)"
    @address = gets.chomp
    puts "That's a great area. We haven't been, but we hear it's a lovely location."
    puts "Within how great of a radius would you like to see these tweets? ex: '1mi/km', '2mi/km'"  #asks for radius
    @radius = gets.chomp
  end

  def coordinize
    coordinates = Geocoder.coordinates(@address)
    @lat = coordinates.first
    @long = coordinates.last
  end
end