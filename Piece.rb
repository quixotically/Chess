class Piece
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
