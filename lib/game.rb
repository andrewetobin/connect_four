require_relative 'board'
require_relative 'messages'
require_relative 'player'
require_relative 'computer'
require_relative 'spot'
require_relative 'validations'

class Game
  include Messages
  include Validations

  attr_reader :player, :computer, :board, :winning_combos
  attr_accessor :round
  def initialize
    @round = 1
  end

  def welcome
    greeting # message to screen
    run_game
  end

  def run_game
    prompt # message to screen
    user_input = input
    start_game_flow(user_input)
    start_turn # message to screen
    user_input = input
    check_input(user_input)
    drop_piece(user_input, "player")
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

  def drop_piece(user_input, player_or_computer)
    one_array = board.board_arrays.flatten
    column = one_array.find_all do |spot|
      spot.column == user_input.upcase
    end
    empties = column.select do |spot|
      spot.state == "."
    end
    drop_spot = empties.min_by do |spot|
      spot.location
    end
    if player_or_computer == "player"
      end_player_turn(drop_spot)
    else
      end_computer_turn(drop_spot)
    end
  end

  def end_player_turn(drop_spot)
    player.spots << drop_spot.location
    drop_spot.player_state
    board.display_board
    if check_for_win(player.spots) == false
      computer_turn
    else
      player_won
      restart
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
    drop_piece(letter, "computer")
  end

  def end_computer_turn(drop_spot)
    computer.spots << drop_spot.location
    drop_spot.computer_state
    if check_for_win(computer.spots) == false
      end_round
    else
      board.display_board
      computer_won
      restart
    end
  end

  def end_round
    @round += 1
    sleep(3)
    board.display_board
    if @round == 22
      draw
    else
    send_back_to_player
    end
  end

  def send_back_to_player
    start_turn
    user_input = input
    check_input(user_input)
    drop_piece(user_input, "player")
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

  def restart
    game = Game.new
    game.run_game
  end
end
