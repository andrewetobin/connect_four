require_relative 'test_helper'
require './lib/game'
require './lib/spot'
require './lib/player'
require './lib/computer'
require './lib/messages'
require './lib/board'

class GameTest < Minitest::Test
include Messages

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_it_starts_at_round_one
    game = Game.new

    assert_equal 1, game.round
  end

  # def test_it_can_add_rounds
  #   game = Game.new
  #   board = Board.new
  #
  #   assert_equal 2, game.end_round
  # end





end
