require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'

class SpotTest < Minitest::Test

  def test_it_exists
    spot = Spot.new(1)

    assert_instance_of Spot, spot
  end



end
