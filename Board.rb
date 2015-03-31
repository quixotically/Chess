class Board
  attr_accessor :grid

  def initialize
    @grid = make_grid

  end

  def make_grid
    Array.new(8) { Array.new(8) }
  end

  def [](pos)

  end

  def []=(pos)

  end
end
