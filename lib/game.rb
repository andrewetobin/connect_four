require_relative 'board'
require_relative 'messages'
require_relative 'player'
require_relative 'computer'
require_relative 'spot'
# require_relative 'validations'

class Game
  include Messages
  # include Validations

  attr_reader :player, :computer, :board
  attr_accessor :round
  # include Validations
  def initialize
    @round = 1
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
    computer_turn
  end

  def computer_turn
    letters = ("A".."G").to_a
    number = rand(0..6)
    letter = letters[number]
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
    @round += 1
    sleep(4)
    board.display_board
    send_back_to_player
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
