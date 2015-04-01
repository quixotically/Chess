# encoding: utf-8

require_relative 'Piece'

class SteppingPiece < Piece
  def moves
    moves = []

    move_dirs.each do |(dx, dy)|
      temp_move = [pos[0] + dx, pos[1] + dy]

      if inside_board?(temp_move)
        if occupied?
          next if same_color?(board[temp_move])
        end

        moves << temp_move
      end
    end

    moves
  end

end
