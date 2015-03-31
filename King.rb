require_relative "Stepping_Piece"


class King < SteppingPiece

  def moves
    moves = []
    move_dirs.each do |(dx, dy)|
      temp_move = [pos[0] + dx, pos[1] + dy]
      moves << temp_move if inside_board?(temp_move)
    end
    moves
  end


  def move_dirs
    DIAGONAL_DELTAS + HORIZONTAL_DELTAS + VERTICAL_DELTAS
  end

end



k = King.new([3,3], "board")

p k.moves
