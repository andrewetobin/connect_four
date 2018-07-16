require_relative 'test_helper'
require './lib/computer'

class ComputerTest < Minitest::Test

  def test_it_exists
    computer = Computer.new

    assert_instance_of Computer, computer
  end



end
