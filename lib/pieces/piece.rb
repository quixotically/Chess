# encoding: utf-8

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

  attr_accessor :pos, :color, :board, :symbol

  def initialize(pos, color, board)
    @pos = pos
    @color = color
    @board = board
  end

  def inspect
    @symbol.inspect
  end

  def moves
  end

  def move_dirs
  end

  def move(new_pos)
    @pos = new_pos
  end

  def occupied?(pos)
    !board[pos].nil?
  end

  def same_color?(other)
    self.color == other.color
  end

  def inside_board?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end

  def dup(new_board)
    self.class.new(self.pos, self.color, new_board)
  end
end
