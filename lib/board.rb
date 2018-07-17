require_relative 'spot'

class Board
  attr_reader :winning_combos
  attr_accessor :board_arrays

  def initialize
    @board_arrays = create_board
    @winning_combos = [[1, 2, 3, 4], [1, 8, 15, 22], [1, 9, 17, 25], [2, 3, 4, 5], [2, 9, 16, 23], [2, 10, 18, 26], [3, 4, 5, 6], [3, 10, 17, 24], [3, 11, 19, 27], [4, 5, 6, 7], [4, 10, 16, 22], [4, 11, 18, 25], [4, 12, 20, 28], [5, 11, 17, 23], [5, 12, 19, 26], [6, 12, 18, 24], [6, 13, 20, 27], [7, 13, 19, 25], [7, 14, 21, 28], [8, 9, 10, 11], [8, 15, 22, 29], [8, 16, 24, 32], [9, 10, 11, 12], [9, 16, 23, 30], [9, 17, 25, 33], [10, 11, 12, 13], [10, 17, 24, 31], [10, 18, 26, 34], [11, 12, 13, 14], [11, 17, 23, 29], [11, 18, 25, 32], [11, 19, 27, 35], [12, 18, 24, 30], [12, 19, 26, 33], [13, 19, 25, 31], [13, 20, 27, 34], [14, 20, 26, 32], [14, 21, 28, 35], [15, 16, 17, 18], [15, 22, 29, 36], [15, 23, 31, 39], [16, 17, 18, 19], [16, 23, 30, 37], [16, 24, 32, 40], [17, 18, 19, 20], [17, 24, 31, 38], [17, 25, 33, 41], [18, 19, 20, 21], [18, 24, 30, 36], [18, 25, 32, 39], [18, 26, 34, 42], [19, 25, 31, 32], [19, 26, 33, 40], [20, 26, 32, 38], [20, 27, 34, 41], [21, 27, 33, 39], [21, 28, 35, 42], [22, 23, 24, 25], [23, 24, 25, 26], [24, 25, 26, 27], [25, 26, 27, 28], [29, 30, 31, 32], [30, 31, 32, 33], [31, 32, 33, 34], [32, 33, 34, 35], [36, 37, 38, 39], [37, 38, 39, 40], [38, 39, 40, 41], [39, 40, 41, 42]]
  end

  def create_board
    spots = [[42, "A"], [41, "B"], [40, "C"], [39, "D"], [38, "E"], [37, "F"], [36, "G"], [35, "A"], [34, "B"], [33, "C"], [32, "D"], [31, "E"], [30, "F"], [29, "G"], [28, "A"], [27, "B"], [26, "C"], [25, "D"], [24, "E"], [23, "F"], [22, "G"], [21, "A"], [20, "B"], [19, "C"], [18, "D"], [17, "E"], [16, "F"], [15, "G"], [14, "A"], [13, "B"], [12, "C"], [11, "D"], [10, "E"], [9, "F"], [8, "G"], [7, "A"], [6, "B"], [5, "C"], [4, "D"], [3, "E"], [2, "F"], [1, "G"]]
    board = spots.map do |spot|
      Spot.new(spot)
    end
    board.each_slice(7).to_a
  end

  def display_board
    board = @board_arrays
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
