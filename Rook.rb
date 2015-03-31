require_relative "Sliding_Piece"


class Rook < SlidingPiece

  def moves
    super
  end

  def move_dirs
    HORIZONTAL_DELTAS + VERTICAL_DELTAS
  end

end

#
# r = Rook.new([0,0], "rook")
#
# p r.moves
