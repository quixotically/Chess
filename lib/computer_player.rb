# encoding: utf-8

class ComputerPlayer
  attr_accessor :color, :board

  def initialize(board, color)
    @board = board
  end

  def set_color(color)
    @color = color
  end

  def select_move(prompt)
    board.enemy_moves(player1.color).sample
  end

  def take_turn
    while true
      pos = select_move("Please select a piece: row,col")

      move = select_move("Where would you like to move?")

      # puts "You've selected #{pos} to #{move}, is that correct? Press 'r' to retry."
      #
      # r2 = gets.chomp.downcase
      # next if r2 == 'r'

      break
    end

    pos = pos[0] - 1, pos[1] - 1
    move = move[0] - 1, move[1] - 1

    [pos, move]
  end
end
