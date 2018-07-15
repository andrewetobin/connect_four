require_relative 'spot'

class Board
  attr_reader :board

  def initialize
    @board = create_board
  end

  def create_board
    spots = [[42, "A"], [41, "B"], [40, "C"], [39, "D"], [38, "E"], [37, "F"], [36, "G"], [35, "A"], [34, "B"], [33, "C"], [32, "D"], [31, "E"], [30, "F"], [29, "G"], [28, "A"], [27, "B"], [26, "C"], [25, "D"], [24, "E"], [23, "F"], [22, "G"], [21, "A"], [20, "B"], [19, "C"], [18, "D"], [17, "E"], [16, "F"], [15, "G"], [14, "A"], [13, "B"], [12, "C"], [11, "D"], [10, "E"], [9, "F"], [8, "G"], [7, "A"], [6, "B"], [5, "C"], [4, "D"], [3, "E"], [2, "F"], [1, "G"]]
    @board = spots.map do |spot|
      Spot.new(spot)
    end
    @board = @board.each_slice(7).to_a
  end

  def display_board
    # board = @board
    puts "\n\n      ABCDEFG
      #{board[0][0].state}#{board[0][1].state}#{board[0][2].state}#{board[0][3].state}#{board[0][4].state}#{board[0][5].state}#{board[0][6].state}
      #{board[1][0].state}#{board[1][1].state}#{board[1][2].state}#{board[1][3].state}#{board[1][4].state}#{board[1][5].state}#{board[1][6].state}
      #{board[2][0].state}#{board[2][1].state}#{board[2][2].state}#{board[2][3].state}#{board[2][4].state}#{board[2][5].state}#{board[2][6].state}
      #{board[3][0].state}#{board[3][1].state}#{board[3][2].state}#{board[3][3].state}#{board[3][4].state}#{board[3][5].state}#{board[3][6].state}
      #{board[4][0].state}#{board[4][1].state}#{board[4][2].state}#{board[4][3].state}#{board[4][4].state}#{board[4][5].state}#{board[4][6].state}
      #{board[5][0].state}#{board[5][1].state}#{board[5][2].state}#{board[5][3].state}#{board[5][4].state}#{board[5][5].state}#{board[5][6].state}   \n\n\n"
  end
end

# board = Board.new
# board.display_board
