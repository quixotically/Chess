# encoding: utf-8
require_relative 'board'
require_relative 'human_player'

class Game
  attr_accessor :board, :player1, :player2

  def initialize(board = nil, player1, player2)
    if board.nil?
      @board = Board.populated_board
    else
      # YAML!
    end

    @player1 = player1
    @player2 = player2
  end

  def play
    player1.select_color
    player1.color == :white ? player2.set_color(:black) : player2.set_color(:white)

    active_player = (player1.color == :white ? player1 : player2)
    turn_no = 1

    puts "White goes first."

    until board.checkmate?(:white) || board.checkmate?(:black)
      puts "Turn number: #{turn_no}"
      puts "Active player: #{active_player.color.capitalize}"
      if board.in_check?(active_player.color)
        puts "#{active_player.color.capitalize} in check!"
      end

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
  end
end

#byebug
p1 = HumanPlayer.new
p2 = HumanPlayer.new

g = Game.new( p1, p2 )
g.play
