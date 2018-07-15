# require_relative 'game'

require_relative 'board'
require_relative 'messages'
require_relative 'player'
require_relative 'computer'
require_relative 'spot'
# require_relative 'validations'

class Connect_Four
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

  def player_turn(user_input)
    one_array = @board.board_arrays.flatten
    column = one_array.find_all do |spot|
      spot.column == user_input.upcase
    end
    drop_spot = column.min_by do |spot|
      spot.state == "." && spot.location
    end
    player.spots << drop_spot.location
    drop_spot.player_state
    board.display_board
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





game = Connect_Four.new
game.run_game

# Game.new.intro
