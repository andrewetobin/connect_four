require 'colorize'

class Spot
  attr_reader   :location
  attr_accessor :state


  def initialize(location)
    @location = location
    @state = "."
  end

  def player_state
    @state = 'X'.red
  end

  def computer_state
    @state = 0
  end

end
