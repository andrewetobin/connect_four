require_relative 'spot'

class Board
  attr_reader :board_array

  def initialize
    @board_array = []
  end

  def create_board
    spots = (1..42).to_a
    @board_array = spots.map do |location|
      Spot.new(location)
    end
    @board_array = @board_array.each_slice(7).to_a
  end
end
