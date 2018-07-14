require 'colorize'

module Messages

  def welcome
    puts "Hello! Welcome to Connect Four :)".white.on_blue.blink
    sleep(5)
  end

  def prompt
    puts 'Would you like to (p)lay, read the (r)rules, or (q)uit?'
  end

  def rules
    puts "Here are the rules of the game:\n\n"
    sleep(1)
    puts "To win Connect Four you must be the first player to get four of your 'X's in a row either horizontally, vertically or diagonally.\n\n"
    sleep(6)
    puts "You will be playing against the computer\n\n"
    sleep(4)
    puts "The computer's spaces will the '0's and your's the 'X's\n\n"
    sleep(6)
    puts "You will be asked which lettered column to drop your piece into\n\n"
    sleep(6)
    puts "The computer will then pick a spot to go\n\n"
    sleep(4)
    puts "The first player to connect four wins!".red.blink
    sleep(4)
  end
end
