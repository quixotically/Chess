# encoding: utf-8

require_relative "sliding_piece"


class Rook < SlidingPiece
  def initialize(pos, color, board)
    super(pos, color, board)
    @symbol = ' ♜ ' if color == :black
    @symbol = ' ♖ ' if color == :white
  end

  def move_dirs
    HORIZONTAL_DELTAS + VERTICAL_DELTAS
  end

end
