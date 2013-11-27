require 'geocoder'

class Request
  attr_accessor :address

  def initialize address
    @address = address
  end

  def coordinates
    @coordinates ||= Geocoder.coordinates(@address)
  end
end
