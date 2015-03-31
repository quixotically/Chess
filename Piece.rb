class Piece
  DIAGONAL_DELTAS   = [ [1,1], [1,-1], [-1,-1], [-1, 1] ]
  HORIZONTAL_DELTAS = [ [1,0], [-1, 0] ]
  VERTICAL_DELTAS   = [ [0,1], [0, -1] ]
  KNIGHT_DELTAS     = [
                        [2,1],
                        [2,-1],
                        [-2,1],
                        [-2,-1],
                        [1,2],
                        [1,-2],
                        [-1,2],
                        [-1,-2],
                      ]
                      
  attr_accessor :pos, :board

  def initialize(pos, board)
    @pos = pos
    @board = board
  end


  def moves(pos)

  end


  def inside_board?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end
end
