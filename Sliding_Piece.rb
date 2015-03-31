require_relative 'Piece'

class SlidingPiece < Piece


  # return an array of places a Piece can move to
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

  # moves needs to know what directions a piece can move in
  # (diagonal, horizontally/vertically, both
  def move_dirs

  end
end
