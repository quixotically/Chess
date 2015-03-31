require_relative 'Stepping_Piece'

class Knight < SteppingPiece

  def moves
    super
  end

  def move_dirs
    KNIGHT_DELTAS
  end
end


# k = Knight.new([0,0], "b")
# k2 = Knight.new([4,4], "b")
#
# p k.moves
# p k2.moves
