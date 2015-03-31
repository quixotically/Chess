require_relative "Sliding_Piece"


class Bishop < SlidingPiece

  def moves
    super
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
