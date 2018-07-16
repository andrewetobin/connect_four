# require_relative 'spot'
# require_relative 'board'
# require_relative 'connect_four'
# require_relative 'validations'

class Player
  include Messages
  # include Validations
  attr_accessor :spots

  def initialize
    @spots = []
  end

  # def turn(user_input)
  #   # check_for_draw
  #   # check_input(user_input)
  #   drop_spot = @board.min_by do |spot|
  #     spot.column == user_input.upcase && spot.location
  #   end
  #   player_state(drop_spot)
  #   board.display_board
  # end

end
