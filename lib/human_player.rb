# encoding: utf-8

class HumanPlayer
  attr_accessor :color, :board

  def initialize(board)
    @board = board
  end

  def select_color
    choice = ''
    while true
      puts "Please select your color. b for black and w for white."
      choice = gets.chomp.downcase
      break unless choice != 'b' && choice != 'w'
    end

    choice == 'b' ? @color = :black : @color = :white
  end

  def set_color(color)
    @color = color
  end

  def select_move(prompt)
    begin
      puts prompt
      pos = gets.chomp.split(",").map(&:to_i)
    rescue
      puts "Invalid position. Try again."
      retry
    end

    pos
  end

  def take_turn
    while true
      pos = select_move("Please select a piece: row,col")

      move = select_move("Where would you like to move?")

      puts "You've selected #{pos} to #{move}, is that correct? Press 'r' to retry, or 'e' to give up"

      r2 = gets.chomp.downcase
      abort("#{self.color.capitalize} surrenders!") if r2 == 'e'
      next if r2 == 'r'

      break
    end

    pos = pos[0] - 1, pos[1] - 1
    move = move[0] - 1, move[1] - 1

    [pos, move]
  end
end
