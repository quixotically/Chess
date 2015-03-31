require_relative 'Piece'

class SlidingPiece < Piece
  def moves
    moves = []
    blocked = Array.new(8) {false}

    1.upto(7) do |multiplier|
      move_dirs.each_with_index do |(dx, dy), idx|
        next if blocked[idx]

        temp_move = [pos[0] + (dx * multiplier), pos[1] + (dy * multiplier)]

        if inside_board?(temp_move)
          if occupied?(temp_move)
            blocked[idx] = true
            next if same_color?(board[temp_move])
          end

          moves << temp_move
        end
      end
    end

    moves
  end
end
