require 'colorize'

class Spot
  attr_reader :location


  def initialize(location)
    @location = location
    @state = nil
  end

end
