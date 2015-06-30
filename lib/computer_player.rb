# encoding: utf-8

class ComputerPlayer
  attr_accessor :color, :board, :opponent_color

  def initialize(board)
    @board = board
  end

  def set_color(color)
    @color = color
    @opponent_color = color == :white ? :black : :white
  end

  def select_move(piece)
    piece.moves.sample
  end

  def select_piece
    pieces = []

    @board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece, col_idx|
        next if piece.nil? || piece.color == opponent_color
        pieces << [row_idx, col_idx]
      end
    end

    pieces.sample
  end

  def take_turn
    while true
      pos = select_piece
      move = select_move(board[pos])
      break
    end

    [pos, move]
  end
end
