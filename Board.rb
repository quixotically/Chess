class Board
  attr_accessor :grid

  def initialize
    @grid = make_grid

  end

  def make_grid
    Array.new(8) { Array.new(8) }
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos1, pos2)
    grid[pos1] = grid[pos2]
  end
end
