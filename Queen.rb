# encoding: utf-8

require_relative 'Sliding_Piece'

class Queen < SlidingPiece
  def initialize(pos, color, board)
    super(pos, color, board)
    @symbol = '♛' if color == :black
    @symbol = '♕' if color == :white
  end

  def move_dirs
    DIAGONAL_DELTAS + HORIZONTAL_DELTAS + VERTICAL_DELTAS
  end
end

# q = Queen.new([0,0], "board")
#
# p q.moves
