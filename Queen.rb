require_relative 'Sliding_Piece'

class Queen < SlidingPiece

  def moves
    moves = []

    1.upto(7) do |multiplier|
      move_dirs.each do |(dx, dy)|
        temp_move = [pos[0] + (dx * multiplier), pos[1] + (dy * multiplier)]
        moves << temp_move if inside_board?(temp_move)
      end
    end

    moves
  end

  def move_dirs
    DIAGONAL_DELTAS + HORIZONTAL_DELTAS + VERTICAL_DELTAS
  end
end

# q = Queen.new([0,0], "board")
#
# p q.moves
