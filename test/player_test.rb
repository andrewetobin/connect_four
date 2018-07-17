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
end
