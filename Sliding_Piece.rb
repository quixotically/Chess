require_relative 'Piece'

class SlidingPiece < Piece
  DIAGONAL_DELTAS   = [ [1,1], [1,-1], [-1,-1], [-1, 1] ]
  HORIZONTAL_DELTAS = [ [1,0], [-1, 0] ]
  VERTICAL_DELTAS   = [ [0,1], [0, -1] ]

  def initialize

  end
  # return an array of places a Piece can move to
  def moves

  end

  # moves needs to know what directions a piece can move in
  # (diagonal, horizontally/vertically, both
  def move_dirs

  end
end
