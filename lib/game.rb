# encoding: utf-8
require 'colorize'
require_relative 'board'
require_relative 'human_player'

class Game
  attr_accessor :board, :player1, :player2

  def initialize(board = nil, num_players)
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
    active_player = (player1.color == :white ? player1 : player2)
    turn_no = 1

    puts "White goes first."

    until board.checkmate?(:white) || board.checkmate?(:black)
      # play_turn turn_no ||= 1
      # turn_msg
      puts "Turn number: #{turn_no}"
      puts "Active player: #{active_player.color.capitalize}"
      if board.in_check?(active_player.color)
        puts "#{active_player.color.capitalize} in check!"
      end
      # turn_msg end

      board.display_grid

      begin
        start_pos, end_pos = active_player.take_turn
        if board.move_into_check?(start_pos, end_pos)
          puts "Can't move into check"
          next
        end

        board.move(start_pos, end_pos, active_player.color)

      rescue
        puts "Invalid move. Try again."
        retry
      end

      active_player = (active_player == player1 ? player2 : player1)
      turn_no += 1
    end

    winner = (active_player == player1 ? player2 : player1)
    puts "#{winner.color.capitalize} wins!"
    # play_turn end
  end

  def set_player_colors
    player1.select_color
    player1.color == :white ? player2.set_color(:black) : player2.set_color(:white)
  end
end

g = Game.new(2)
g.play
