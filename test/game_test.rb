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

  # def test_check_for_win
  #   game = Game.new
  #   board = Board.new
  #
  #   horizontal_1 = [1,2,3,4]
  #   horizontal_2 = [24,25,26,27]
  #   vertical_1 = [1,8,15,22,]
  #   vertical_2 = [19,26,33,40]
  #   diagonal_1 = [1,9,17,25]
  #   diagonal_2 = [13,19,25,31]
  #   random_1 = [13,15,42,32,12,3,7,24]
  #   random_2 = [12,34,11,5,3,22,27]
  #
  #   assert_equal true, game.check_for_win(horizontal_1)
  #   assert_equal true, game.check_for_win(horizontal_2)
  #   assert_equal true, game.check_for_win(vertical_1)
  #   assert_equal true, game.check_for_win(vertical_2)
  #   assert_equal true, game.check_for_win(diagonal_1)
  #   assert_equal true, game.check_for_win(diagonal_2)
  #   assert_equal false, game.check_for_win(random_1)
  #   assert_equal false, game.check_for_win(random_2)
  # end

  # def test_it_can_add_rounds
  #   game = Game.new
  #   board = Board.new
  #
  #   assert_equal 2, game.end_round
  # end





end
