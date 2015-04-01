# encoding: utf-8

require_relative "Stepping_Piece"


class King < SteppingPiece
  def initialize(pos, color, board)
    super(pos, color, board)
    @symbol = '♚' if color == :black
    @symbol = '♔' if color == :white
  end

  def move_dirs
    DIAGONAL_DELTAS + HORIZONTAL_DELTAS + VERTICAL_DELTAS
  end
end


#
# k = King.new([3,3], "board")
#
# p k.moves
