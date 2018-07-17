# require_relative 'spot'
# require_relative 'board'
# require_relative 'connect_four'
# require_relative 'validations'

class Player
  # include Messages
  # include Validations
  attr_accessor :spots

  def initialize
    @spots = []
  end

  # def check_input(input)
  #   if ("A".."Z").include?(input.upcase) && input.length == 1 && check_column(input) == true
  #   input
  #   else
  #     invalid_choice
  #     send_back_to_player
  #   end
  # end
  #
  # def check_column(user_input)
  #   one_array = board.board_arrays.flatten
  #   column = one_array.find_all do |spot|
  #     spot.column == user_input.upcase
  #   end
  #   available = column.any? do |spot|
  #     spot.state == "."
  #   end
  #   return available
  # end
  #
  # def player_turn(user_input)
  #   one_array = @board.board_arrays.flatten
  #   column = one_array.find_all do |spot|
  #     spot.column == user_input.upcase
  #   end
  #   empties = column.select do |spot|
  #     spot.state == "."
  #   end
  #   drop_spot = empties.min_by do |spot|
  #     spot.location
  #   end
  #   player.spots << drop_spot.location
  #   drop_spot.player_state
  #   board.display_board
  #   check_for_win(player.spots)
  #   # computer_turn
  # end
  #
  # def check_for_win(spots)
  #   check = board.winning_combos.find do |combo|
  #     (combo & spots) == combo
  #   end
  #   if check == nil
  #    computer_turn
  #   else
  #     player_won
  #     quit
  #   end
  # end

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
