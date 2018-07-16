require_relative 'test_helper'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_it_exists
    player = Player.new

    assert_instance_of Player, player 
  end



end
