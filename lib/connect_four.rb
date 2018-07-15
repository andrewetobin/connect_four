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
  end





end





game = Connect_Four.new
game.start

# Game.new.intro
