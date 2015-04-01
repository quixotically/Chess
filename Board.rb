# encoding: utf-8

require_relative 'Piece'
require_relative 'Sliding_Piece'
require_relative 'Stepping_Piece'
require_relative 'Queen'
require_relative 'King'
require_relative 'Bishop'
require_relative 'Knight'
require_relative 'Rook'
require_relative 'Pawn'
require 'colorize'
require 'byebug'

class Board
  attr_accessor :grid

  def initialize
    @grid = make_grid
  end

  def make_grid
    Array.new(8) { Array.new(8) }
  end

  def self.populated_board
    board = Board.new
    board.populate
    board
  end

  def populate
    grid.each_with_index do |row, idx|
      if idx == 1
        row.each_index do |idx2|
          row[idx2] = Pawn.new([idx, idx2], :black, self)
        end

      elsif idx == 6
        row.each_index do |idx2|
          row[idx2] = Pawn.new([idx, idx2], :white, self)
        end

      elsif idx == 0
        populate_special_pieces(row, idx, :black)

      elsif idx == 7
        populate_special_pieces(row, idx, :white)
      end
    end
  end

  def populate_special_pieces(row, row_idx, color)
    row.each_index do |idx|
      if idx == 0 || idx == 7
        row[idx] = Rook.new([row_idx, idx], color, self)
      elsif idx == 1 || idx == 6
        row[idx] = Knight.new([row_idx, idx], color, self)
      elsif idx == 2 || idx == 5
        row[idx] = Bishop.new([row_idx, idx], color, self)
      elsif idx == 3
        row[idx] = Queen.new([row_idx, idx], color, self)
      else
        row[idx] = King.new([row_idx, idx], color, self)
      end
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    grid[row][col] = piece
  end

  def move(start_pos, end_pos)
    piece = self[start_pos]

    raise InvalidMoveError.new if piece.nil? || !piece.moves.include?(end_pos)

    piece.move(end_pos)
    self[start_pos] = nil
    self[end_pos] = piece
  end

  def move_into_check?(start_pos, end_pos)
    piece = self[start_pos]
    dup_board = dup
    dup_board.move(start_pos, end_pos)
    dup_board.in_check?(piece.color)

  end

  def find_king(color)
    grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece, col_idx|
       if piece.class == King && piece.color == color
          return [row_idx, col_idx]
        end
      end
    end
  end

  def in_check?(color)
    king_pos = find_king(color)
    enemy_moves(color).include?(king_pos)
  end

  def enemy_moves(color)
    enemy_moves = []
    grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece, col_idx|
        next if piece.nil? || piece.color == color
        enemy_moves.concat(piece.moves)
      end
    end
    enemy_moves
  end


  def checkmate?(color)
    valid_moves = []

    grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece, col_idx|
        next if piece.nil? || piece.color != color

        possible_moves = piece.moves
        possible_moves.each do |potential|
          valid_moves << potential unless move_into_check?(piece.pos, potential)
        end
      end
    end

    valid_moves.empty?
  end

  def dup
    dup_board = Board.new

    grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece, col_idx|
        pos = [row_idx, col_idx]
        next if piece.nil?
        dup_board[pos] = piece.dup(dup_board)
      end
    end

    dup_board
  end

  def display_grid
    puts
    grid.each do |row|
      temp_row = []
      row.each do |space|
        if space.nil?
          temp_row << '-'
        else
          temp_row << space.symbol
        end
      end
      puts temp_row.join(' ')
    end
  end
end

class InvalidMoveError < StandardError
end

class MoveIntoCheckError < StandardError
end

board = Board.populated_board

#in_check?(color) test!
board.move([1,4],[3,4])
board.display_grid
board.move([6,6], [4,6])
board.display_grid
puts board.in_check?(:white)
board.move([0,3], [4,7])
puts board.in_check?(:white)
board.move([6,5], [5,5])
puts board.checkmate?(:white)

board.display_grid
