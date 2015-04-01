# encoding: utf-8

require 'colorize'
require 'byebug'

class HumanPlayer
  attr_accessor :color

  # def initialize
  #
  # end

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

  def take_turn
    while true
      begin

        puts "Please select a piece: row,col"
        pos = gets.chomp.split(",").map(&:to_i)
        start_pos = pos[0] - 1, pos[1] - 1

      rescue
        puts "Invalid position. Try again."
        retry
      end

      puts "You've selected a #{pos}, is that correct? Press 'r' to retry"
      r = gets.chomp.downcase
      next if r == 'r'

      begin
        puts "Where would you like to move?"
        move = gets.chomp.split(",").map(&:to_i)
        end_pos = move[0] - 1, move[1] - 1

      rescue
        puts "Invalid position. Try again."
        retry
      end

      puts "You've selected a #{move}, is that correct? Press 'r' to retry"
      r2 = gets.chomp.downcase
      next if r2 == 'r'

      break

    end

    [start_pos, end_pos]
  end
end
