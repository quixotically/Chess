require_relative 'Sliding_Piece'

class Queen < SlidingPiece
  def move_dirs
    DIAGONAL_DELTAS + HORIZONTAL_DELTAS + VERTICAL_DELTAS
  end
end

# q = Queen.new([0,0], "board")
#
# p q.moves
