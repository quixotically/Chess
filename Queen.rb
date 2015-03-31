require_relative 'Sliding_Piece'

class Queen < SlidingPiece

  def initialize
  end


  def move_dirs
    directions = DIAGONAL_DELTAS + HORIZONTAL_DELTAS + VERTICAL_DELTAS
  end
end
