# encoding: utf-8

require_relative "sliding_piece"


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
