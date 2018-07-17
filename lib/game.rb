require_relative 'board'
require_relative 'messages'
require_relative 'player'
require_relative 'computer'
require_relative 'spot'
# require_relative 'validations'

class Game
  include Messages
  # include Validations

  attr_reader :player, :computer, :board, :winning_combos
  attr_accessor :round
  # include Validations
  def initialize
    @round = 1
    @winning_combos = [[1, 2, 3, 4], [1, 8, 15, 22], [1, 9, 17, 25], [2, 3, 4, 5], [2, 9, 16, 23], [2, 10, 18, 26], [3, 4, 5, 6], [3, 10, 17, 24], [3, 11, 19, 27], [4, 5, 6, 7], [4, 10, 16, 22], [4, 11, 18, 25], [4, 12, 20, 28], [5, 11, 17, 23], [5, 12, 19, 26], [6, 12, 18, 24], [6, 13, 20, 27], [7, 13, 19, 25], [7, 14, 21, 28], [8, 9, 10, 11], [8, 15, 22, 29], [8, 16, 24, 32], [9, 10, 11, 12], [9, 16, 23, 30], [9, 17, 25, 33], [10, 11, 12, 13], [10, 17, 24, 31], [10, 18, 26, 34], [11, 12, 13, 14], [11, 17, 23, 29], [11, 18, 25, 32], [11, 19, 27, 35], [12, 18, 24, 30], [12, 19, 26, 33], [13, 19, 25, 31], [13, 20, 27, 34], [14, 20, 26, 32], [14, 21, 28, 35], [15, 16, 17, 18], [15, 22, 29, 36], [15, 23, 31, 39], [16, 17, 18, 19], [16, 23, 30, 37], [16, 24, 32, 40], [17, 18, 19, 20], [17, 24, 31, 38], [17, 25, 33, 41], [18, 19, 20, 21], [18, 24, 30, 36], [18, 25, 32, 39], [18, 26, 34, 42], [19, 25, 31, 32], [19, 26, 33, 40], [20, 26, 32, 38], [20, 27, 34, 41], [21, 27, 33, 39], [21, 28, 35, 42], [22, 23, 24, 25], [23, 24, 25, 26], [24, 25, 26, 27], [25, 26, 27, 28], [29, 30, 31, 32], [30, 31, 32, 33], [31, 32, 33, 34], [32, 33, 34, 35], [36, 37, 38, 39], [37, 38, 39, 40], [38, 39, 40, 41], [39, 40, 41, 42]]
  end

  def run_game
    welcome
    prompt
    user_input = input
    start_game_flow(user_input)
    start_turn
    user_input = input
    check_input(user_input)
    player_turn(user_input)
  end

  def input
    print '> '
    gets.strip.downcase
  end


  def start_game_flow(user_input)
    if user_input == 'p' || user_input == 'play'
      @player = Player.new
      @computer = Computer.new
      @board = Board.new
      board.display_board
    elsif user_input == 'r' || user_input == 'rules'
      rules
      loop_back
    elsif user_input == 'q' || user_input == 'quit'
      quit
    else
      invalid_choice
      loop_back
    end
  end

  def check_input(input)
    if ("A".."Z").include?(input.upcase) && input.length == 1 && check_column(input) == true
    input
    else
      invalid_choice
      send_back_to_player
    end
  end

  def check_column(user_input)
    one_array = @board.board_arrays.flatten
    column = one_array.find_all do |spot|
      spot.column == user_input.upcase
    end
    available = column.any? do |spot|
      spot.state == "."
    end
    return available
  end

  def player_turn(user_input)
    one_array = @board.board_arrays.flatten
    column = one_array.find_all do |spot|
      spot.column == user_input.upcase
    end
    empties = column.select do |spot|
      spot.state == "."
    end
    drop_spot = empties.min_by do |spot|
      spot.location
    end
    player.spots << drop_spot.location
    drop_spot.player_state
    board.display_board
    check_for_win(player.spots)
    # computer_turn
  end

  def check_for_win(spots)
    check = winning_combos.find do |combo|
      (combo & spots) == combo
    end
    if check == nil
     computer_turn
    else
      player_won
      quit
    end
  end

  def computer_turn
    letters = ("A".."G").to_a
    number = rand(0..6)
    letter = letters[number]
    if check_column(letter) == true
      letter
    else
      computer_turn
    end
    computer_drop(letter)
  end


  def computer_drop(letter)
    one_array = @board.board_arrays.flatten
    column = one_array.find_all do |spot|
      spot.column == letter.upcase
    end
    empties = column.select do |spot|
      spot.state == "."
    end
    drop_spot = empties.min_by do |spot|
      spot.location
    end
    computer.spots << drop_spot.location
    drop_spot.computer_state
    computer_for_win(computer.spots)
  end

  def end_round
    @round += 1
    sleep(4)
    board.display_board
    if @round == 22
      draw
    else
    send_back_to_player
    end
  end

  def computer_for_win(spots)
    check = winning_combos.find do |combo|
      (combo & spots) == combo
    end
    if check == nil
    end_round
    else
      board.display_board
      computer_won
      quit
    end
  end

  def send_back_to_player
    start_turn
    user_input = input
    check_input(user_input)
    player_turn(user_input)
  end

  def loop_back
    prompt
    user_input = input
    start_game_flow(user_input)
  end

  def quit
    puts 'Goodbye.'
    exit
  end





end
