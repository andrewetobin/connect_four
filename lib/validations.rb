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




  # def check_for_draw
  #   if @game.round == 22
  #     draw
  #     @game.loop_back
  #   end
  # end

  # def check_input(input)
  #   if ("A".."Z").include?(input.upcase) && input.length == 1 && check_column(input) == true
  #     return input
  #   else
  #     invalid_choice
  #     user_input = input
  #     check_input(user_input)
  #     player_turn(user_input)
  #   end
  # end
  #
  # def check_column(user_input)
  #   one_array = @board.board_arrays.flatten
  #   column = one_array.find_all do |spot|
  #     spot.column == user_input.upcase
  #   end
  #   column.any? do |spot|
  #     spot.state == "."
  #   end
  # end




end





# [[7,14,21,28],[7,13,19,25],[7,6,5,4],[6,13,20,27],[6,5,4,3],[6,12,18,24],[5,12,19,26],[5,11,17,23],[5,4,3,2],[4,11,18,25],[4,10,16,22],[4,3,2,1],[4,12,20,28],[3,11,19,27],[3,10,17,24],[2,10,18,26],[2,9,16,23],[1,9,17,25],[1,8,15,22],[14,21,28,35],[14,20,26,32],[14,13,12,11],[13,20,27,34],[13,19,25,31],[13,12,11,10],[12,19,26,33],[12,18,24,30],[12,11,10,9],[11,19,27,35],[11,18,25,32],[11,17,23,29],[11,10,9,8],[10,18,26,34],[10,17,24,31],[9,17,25,33],[9,16,23,30],[8,16,24,32],[8,15,22,29],[21,28,35,42],[21,27,33,39],[21,20,19,18],[20,27,34,41],[20,26,32,38],[20,19,18,17],[19,26,33,40],[19,25,31,32],[19,18,17,16],[18,26,34,42],[18,25,32,39],[18,17,16,15],[18,24,30,36],[17,25,33,41],[17,24,31,38],[16,24,32,40],[16,23,30,37],[15,23,31,39],[15,22,29,36],[28,27,26,25],[27,26,25,24],[26,25,24,23],[25,24,23,22],[35,34,33,32],[34,33,32,31],[33,32,31,30],[32,31,30,29],[42,41,40,39],[41,40,39,38],[40,39,38,37],[39,38,37,36]]
