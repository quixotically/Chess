require_relative 'Piece'

class Pawn < Piece
  PAWN_DELTAS = {
    first_black: [[2, 0], [1, 0], [1, -1], [1, 1]],
    first_white: [[-2,0], [-1,0], [-1, 1], [-1, -1]],
    black: [[1, 0], [1, -1], [1, 1]],
    white: [[-1,0], [-1, 1], [-1, -1]]
  }

  def initialize(pos, color, board)
    super(pos, color, board)
    @has_moved = false
  end

  def has_moved?
    @has_moved
  end

  def move
    @has_moved = true
  end

  def moves
    moves = []
    move_dirs.each do |(dx, dy)|
      temp_move = [pos[0] + dx, pos[1] + dy]

      if inside_board?(temp_move)
        if !board[temp_move].nil?
          if board[temp_move].color == self.color
            next
          else
            moves << temp_move unless dy == 0 ### if dy != 0 then piece is moving diagonally
            next
          end
        end
      next unless dy == 0 ### if dy not 0 then the move is diagonal and illegal
      moves << temp_move
      end
    end

    moves
  end


  def move_dirs
    if color == :white
      if has_moved?
        PAWN_DELTAS[:white]
      else
        PAWN_DELTAS[:first_white]
      end
    else
      if has_moved?
        PAWN_DELTAS[:black]
      else
        PAWN_DELTAS[:first_black]
      end
    end
  end

end
