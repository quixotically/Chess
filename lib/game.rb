# encoding: utf-8
require 'colorize'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :player1, :player2, :turn_num, :active_player

  def initialize(board = nil, num_players)
    @turn_num = 1

    if board.nil?
      @board = Board.populated_board
    else
      # YAML!
    end

    if num_players == 2
      @player1 = HumanPlayer.new(@board)
      @player2 = HumanPlayer.new(@board)
    else
      @player1 = HumanPlayer.new(@board)
      @player2 = ComputerPlayer.new(@board)
    end
  end

  def play
    self.set_player_colors
    @active_player = (player1.color == :white ? player1 : player2)
    puts "White goes first."

    self.play_turn until board.checkmate?(:white) || board.checkmate?(:black)

    self.display_winner
  end

  def play_turn
    self.display_turn_status

    self.try_move

    self.switch_active_player
    @turn_num += 1
  end

  def set_player_colors
    player1.select_color
    player1.color == :white ? player2.set_color(:black) : player2.set_color(:white)
  end

  def display_turn_status
    puts "Turn number: #{turn_num}"
    puts "Active player: #{active_player.color.capitalize}"
    if board.in_check?(active_player.color)
      puts "#{active_player.color.capitalize} in check!"
    end

    board.display_grid
  end

  def try_move
    begin
      start_pos, end_pos = active_player.take_turn
      if board.move_into_check?(start_pos, end_pos)
        raise MoveIntoCheckError
      end

      board.move(start_pos, end_pos, active_player.color)
    rescue MoveIntoCheckError
      puts "Can't move into check"
      retry
    rescue InvalidMoveError
      puts "Invalid move. Try again."
      retry
    rescue
      puts "Invalid move. Try again."
      retry
    end
  end

  def display_winner
    board.display_grid
    winner = (active_player == player1 ? player2 : player1)
    puts "#{winner.color.capitalize} wins!"
  end

  def switch_active_player
    @active_player = (active_player == player1 ? player2 : player1)
  end
end

puts "How many players?"
num_players = gets.chomp.to_i
g = Game.new(num_players)
g.play

# checkmate
# 7,6 => 5,6
# 2,5 => 4,5
# 7,7 => 5,7
# 1,4 => 5,8
