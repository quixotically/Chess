require_relative 'Piece'
require_relative 'Sliding_Piece'
require_relative 'Stepping_Piece'
require_relative 'Queen'
require_relative 'King'
require_relative 'Bishop'
require_relative 'Knight'
require_relative 'Rook'
require_relative 'Pawn'

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

  def []=(pos1, pos2)
    grid[pos1] = grid[pos2]
  end

  def display_grid

    grid.each do |row|
      temp_row = []
      row.each do |space|
        if space.nil?
          temp_row << '----'
        else
          temp_row << space.class
        end
      end
      p temp_row.join(' ')
    end
  end
end



board = Board.populated_board
pawn = Pawn.new([1,1], :black, board)
pawn2 = Pawn.new([2,2], :white, board)
pawn3 = Pawn.new([2,0], :black, board)
pawn3.move
pawn4 = Pawn.new([4,1], :black, board)

p pawn.moves
p pawn2.moves
p pawn3.moves
p pawn4.moves

#p queen.moves

board.display_grid
