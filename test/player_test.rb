require_relative 'test_helper'
require './lib/player'
require './lib/game'
require './lib/board'
require './lib/spot'
require './lib/computer'


class PlayerTest < Minitest::Test

  def test_it_exists
    player = Player.new

    assert_instance_of Player, player
  end

  def test_it_starts_with_zero_spots
    player = Player.new

    assert_equal [], player.spots
  end

  # def test_it_can_add_spots
  #   player = Player.new
  #   game = Game.new
  #   board = Board.new
  #   spot_1 = Spot.new([7, "A"])
  #   spot_2 = Spot.new([14, "A"])
  #
  #   game.end_player_turn(spot_1)
  #   game.end_player_turn(spot_2)
  #
  #   assert_equal [7,14], player.spots
  # end
end
