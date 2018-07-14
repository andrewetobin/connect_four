require_relative 'spot'

class Board
  attr_reader :board_array

  def initialize
    @board_array = []
  end

  def create_board
    spots = (1..42).to_a.reverse
    @board_array = spots.map do |location|
      Spot.new(location)
    end
    @board_array = @board_array.each_slice(7).to_a
  end

  def display_board
    board = @board_array
    puts "      ABCDEFG
      #{board[0][0].state}#{board[0][1].state}#{board[0][2].state}#{board[0][3].state}#{board[0][4].state}#{board[0][5].state}#{board[0][6].state}
      #{board[1][0].state}#{board[1][1].state}#{board[1][2].state}#{board[1][3].state}#{board[1][4].state}#{board[1][5].state}#{board[1][6].state}
      #{board[2][0].state}#{board[2][1].state}#{board[2][2].state}#{board[2][3].state}#{board[2][4].state}#{board[2][5].state}#{board[2][6].state}
      #{board[3][0].state}#{board[3][1].state}#{board[3][2].state}#{board[3][3].state}#{board[3][4].state}#{board[3][5].state}#{board[3][6].state}
      #{board[4][0].state}#{board[4][1].state}#{board[4][2].state}#{board[4][3].state}#{board[4][4].state}#{board[4][5].state}#{board[4][6].state}
      #{board[5][0].state}#{board[5][1].state}#{board[5][2].state}#{board[5][3].state}#{board[5][4].state}#{board[5][5].state}#{board[5][6].state}   "
    end
end
