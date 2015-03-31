require_relative 'Piece'

class SlidingPiece < Piece
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
end
