require_relative 'test_helper'
require './lib/board'
require './lib/spot'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_creates_board
    board = Board.new

    expected =

    assert_equal expected, board.create_board
  end





end
