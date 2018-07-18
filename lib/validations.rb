require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'spot'

module Validations

  def check_column(user_input)
    one_array = board.board_arrays.flatten
    column = one_array.find_all do |spot|
      spot.column == user_input.upcase
    end
    available = column.any? do |spot|
      spot.state == "."
    end
    return available
  end

  def check_for_win(spots)
    check = board.winning_combos.find do |combo|
      (combo & spots) == combo
    end
    if check == nil
      false
    else
      true
    end
  end

end
