require_relative 'Piece'

class SteppingPiece < Piece
  def moves
    moves = []

    move_dirs.each do |(dx, dy)|
      temp_move = [pos[0] + dx, pos[1] + dy]
      moves << temp_move if inside_board?(temp_move)
    end
    
    moves
  end
end
