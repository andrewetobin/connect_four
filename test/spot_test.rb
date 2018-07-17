require_relative 'test_helper'
require './lib/spot'

class SpotTest < Minitest::Test

  def test_it_exists
    spot = Spot.new([34, "A"])

    assert_instance_of Spot, spot
  end

  def test_it_has_attributes
    spot = Spot.new([34, "A"])

    assert_equal 34, spot.location
    assert_equal "A", spot.column
    assert_equal ".", spot.state
  end

  def test_state_can_change
    spot = Spot.new([34, "A"])

    spot.player_state
    assert_equal 'X'.red, spot.state

    spot.computer_state
    assert_equal 0, spot.state
  end
end
