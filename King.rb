require_relative "Stepping_Piece"


class King < SteppingPiece
  def move_dirs
    DIAGONAL_DELTAS + HORIZONTAL_DELTAS + VERTICAL_DELTAS
  end
end


#
# k = King.new([3,3], "board")
#
# p k.moves
