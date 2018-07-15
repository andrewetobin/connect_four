require_relative 'test_helper'
require './lib/spot'

class SpotTest < Minitest::Test

  def test_it_exists
    spot = Spot.new(1)

    assert_instance_of Spot, spot
  end



end
