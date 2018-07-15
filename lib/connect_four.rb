require_relative 'game'
require_relative 'board'
require_relative 'messages'
require_relative 'player'
require_relative 'computer'
# require_relative 'validations'

class Connect_Four
  include Messages
  # include Validations

  def start
    welcome
    prompt
    user_input = input
    start_game_flow(user_input)
  end

  def input
    print '> '
    gets.strip.downcase
  end


  def start_game_flow(user_input)
    if user_input == 'p' || user_input == 'play'
      board = Board.new
      board.display_board
    elsif user_input == 'r' || user_input == 'rules'
      rules
      loop_back
    elsif user_input == 'q' || user_input == 'quit'
      quit
    else
      puts "\nInvalid choice. Try again.\n".red 
      loop_back
    end
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
game.start

# Game.new.intro
