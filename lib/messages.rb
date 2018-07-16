require 'colorize'

module Messages

  def welcome
    puts "Hello! Welcome to Connect Four :)".white.on_blue.blink
    sleep(2)
  end

  def prompt
    puts 'Would you like to (p)lay, read the (r)rules, or (q)uit?'
  end

  def rules
    puts "\nHere are the rules of the game:\n\n"
    sleep(2)
    puts "To win Connect Four you must be the first player to get four of your 'X's in a row either horizontally, vertically, or diagonally.\n\n"
    sleep(6)
    puts "You will be playing against the computer.\n\n"
    sleep(4)
    puts "The computer's spaces will be the '0's and your's the 'X's.\n\n"
    sleep(6)
    puts "You will be asked which lettered column to drop your piece into.\n\n"
    sleep(6)
    puts "The computer will then pick a spot to go.\n\n"
    sleep(4)
    puts "The first player to connect four wins!".red.blink
    sleep(4)
  end

  def invalid_spot
    "The column is full, please pick another column to drop your piece into.\n"
    sleep(4)
  end

  def invalid_choice
    puts "\nInvalid choice. Try again.\n".red
  end

  def start_turn
    puts "Please pick one of the letters (A-G) at the top of the grid to drop your piece into.\n\n"
  end

  def player_won
    puts "AMAZING you won!! ".white.on_red.blink
  end

  def computer_won
    puts "Sorry, the computer won.... :("
  end

  def draw
    puts "The game has ended in a draw"
  end
end
