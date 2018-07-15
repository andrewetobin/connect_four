require 'colorize'

class Spot
  attr_reader   :location, :column
  attr_accessor :state


  def initialize(spot)
    @location = spot[0]
    @column = spot[1]
    @state = "."
  end

  def player_state
    @state = 'X'.red
  end

  def computer_state(drop_spot)
    @state = 0
  end

end
