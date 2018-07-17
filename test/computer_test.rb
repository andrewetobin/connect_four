require_relative 'test_helper'
require './lib/computer'

class ComputerTest < Minitest::Test

  def test_it_exists
    computer = Computer.new

    assert_instance_of Computer, computer
  end

  def test_it_starts_with_zero_spots
    computer = Computer.new

    assert_equal [], computer.spots
  end
end
