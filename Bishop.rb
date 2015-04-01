# encoding: utf-8

require_relative "Sliding_Piece"


class Bishop < SlidingPiece
  def initialize(pos, color, board)
    super(pos, color, board)
    @symbol = '♝' if color == :black
    @symbol = '♗' if color == :white
  end

  def move_dirs
    DIAGONAL_DELTAS
  end
end



#
# b = Bishop.new([1,1], "board")
#
#
# p b.moves
