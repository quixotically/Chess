class Piece
  DIAGONAL_DELTAS   = [ [1,1], [1,-1], [-1,-1], [-1, 1] ]
  HORIZONTAL_DELTAS = [ [1,0], [-1, 0] ]
  VERTICAL_DELTAS   = [ [0,1], [0, -1] ]
  
  attr_accessor :pos, :board

  def initialize(pos, board)
    @pos = pos
    @board = board
  end

  def moves

  end


  def inside_board?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end
end